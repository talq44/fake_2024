//
//  UserAPICoreImpl.swift
//  UserAPICoreInterface
//
//  Created by 박창규 on 11/23/24.
//

import Foundation

import UserAPICoreInterface

import Alamofire

import Moya

public class UserAPICoreImpl {
    
    public init(baseURL: String) {
        Constants.baseURL = baseURL
    }
    
    private let provider: MoyaProvider<API> = {
        var plugins: [PluginType] = []
        
#if DEBUG
        let config = NetworkLoggerPlugin.Configuration(logOptions: .verbose)
        plugins.append(NetworkLoggerPlugin(configuration: config))
#endif
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = Constants.timeoutIntervalForRequest
        configuration.timeoutIntervalForResource = Constants.timeoutIntervalForResource
        configuration.requestCachePolicy = .useProtocolCachePolicy
        
        return MoyaProvider<API>(
            session: Session(configuration: configuration),
            plugins: plugins
        )
    }()
    
    func requestJson<T: Decodable>(_ target: API, type: T.Type) async throws -> T {
        guard NetworkReachabilityManager()?.isReachable == true else {
            throw UserAPICoreError.networkNotConnect
        }
        
        return try await withCheckedThrowingContinuation { [weak self] continuation in
            
            guard let self = self else {
                continuation.resume(throwing: UserAPICoreError.unDefined)
                return
            }
            
            self.provider.request(target) { result in
                switch result {
                case .success(let response):
                    do {
                        let model = try JSONDecoder().decode(
                            T.self,
                            from: response.data
                        )
                        continuation.resume(returning: model)
                    }
                    catch {
                        self.printError(error: error)
                        let amondzError = response.convertError
                        continuation.resume(throwing: amondzError)
                    }
                    
                case .failure(let error):
                    self.printError(error: error)
                    continuation.resume(throwing: error.apiError)
                }
            }
        }
    }
    
    private func printError(error: Error) {
#if DEBUG
        do {
            throw error
        } catch let DecodingError.dataCorrupted(context) {
            print(context)
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key '\(key)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value '\(value)' not found:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch let DecodingError.typeMismatch(type, context)  {
            print("Type '\(type)' mismatch:", context.debugDescription)
            print("codingPath:", context.codingPath)
        } catch {
            print("error: ", error)
        }
#endif
    }
}

extension Error {
    internal var apiError: UserAPICoreError {
        do {
            throw self
        } catch DecodingError.dataCorrupted(_) {
            return .serializationFailed
        } catch DecodingError.keyNotFound(_, _) {
            return .serializationFailed
        } catch DecodingError.valueNotFound(_, _) {
            return .serializationFailed
        } catch DecodingError.typeMismatch(_, _)  {
            return .serializationFailed
        } catch {
            return .unDefined
        }
    }
}

extension Response {
    private var statusCodeType: HTTPStatusCode? {
        return HTTPStatusCode(rawValue: self.statusCode)
    }

    internal var convertError: UserAPICoreError {
        guard let statusCode = self.statusCodeType else {
            return UserAPICoreError.serializationFailed
        }

        guard statusCode.responseType != .success else {
            return UserAPICoreError.serializationFailed
        }

        guard statusCode.responseType == .clientError else {
            return UserAPICoreError.unDefined
        }

        return UserAPICoreError.unDefined
    }
}
