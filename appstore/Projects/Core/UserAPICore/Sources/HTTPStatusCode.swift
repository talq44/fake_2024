//
//  HTTPStatusCode.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

enum HTTPStatusCode: Int, Error {
    
    /// The response class representation of status codes, these get grouped by their first digit.
    enum ResponseType {
        
        /// - informational: This class of status code indicates a provisional response, consisting only of the Status-Line and optional headers, and is terminated by an empty line.
        case informational
        
        /// - success: This class of status codes indicates the action requested by the client was received, understood, accepted, and processed successfully.
        case success
        
        /// - redirection: This class of status code indicates the client must take additional action to complete the request.
        case redirection
        
        /// - clientError: This class of status code is intended for situations in which the client seems to have erred.
        case clientError
        
        /// - serverError: This class of status code indicates the server failed to fulfill an apparently valid request.
        case serverError
        
        /// - undefined: The class of the status code cannot be resolved.
        case undefined
    }
    
    //
    // Informational - 1xx
    //
    
    /// - continue: The server has received the request headers and the client should proceed to send the request body.
    case code_100 = 100
    
    /// - switchingProtocols: The requester has asked the server to switch protocols and the server has agreed to do so.
    case code_101 = 101
    
    /// - processing: This code indicates that the server has received and is processing the request, but no response is available yet.
    case code_102 = 102
    
    //
    // Success - 2xx
    //
    
    /// - ok: Standard response for successful HTTP requests.
    case code_200 = 200
    
    /// - created: The request has been fulfilled, resulting in the creation of a new resource.
    case code_201 = 201
    
    /// - accepted: The request has been accepted for processing, but the processing has not been completed.
    case code_202 = 202
    
    /// - nonAuthoritativeInformation: The server is a transforming proxy (e.g. a Web accelerator) that received a 200 OK from its origin, but is returning a modified version of the origin's response.
    case code_203 = 203
    
    /// - noContent: The server successfully processed the request and is not returning any content.
    case code_204 = 204
    
    /// - resetContent: The server successfully processed the request, but is not returning any content.
    case code_205 = 205
    
    /// - partialContent: The server is delivering only part of the resource (byte serving) due to a range header sent by the client.
    case code_206 = 206
    
    /// - multiStatus: The message body that follows is an XML message and can contain a number of separate response codes, depending on how many sub-requests were made.
    case code_207 = 207
    
    /// - alreadyReported: The members of a DAV binding have already been enumerated in a previous reply to this request, and are not being included again.
    case code_208 = 208
    
    /// - IMUsed: The server has fulfilled a request for the resource, and the response is a representation of the result of one or more instance-manipulations applied to the current instance.
    case code_226 = 226
    
    //
    // Redirection - 3xx
    //
    
    /// - multipleChoices: Indicates multiple options for the resource from which the client may choose
    case code_300 = 300
    
    /// - movedPermanently: This and all future requests should be directed to the given URI.
    case code_301 = 301
    
    /// - found: The resource was found.
    case code_302 = 302
    
    /// - seeOther: The response to the request can be found under another URI using a GET method.
    case code_303 = 303
    
    /// - notModified: Indicates that the resource has not been modified since the version specified by the request headers If-Modified-Since or If-None-Match.
    case code_304 = 304
    
    /// - useProxy: The requested resource is available only through a proxy, the address for which is provided in the response.
    case code_305 = 305
    
    /// - switchProxy: No longer used. Originally meant "Subsequent requests should use the specified proxy.
    case code_306 = 306
    
    /// - temporaryRedirect: The request should be repeated with another URI.
    case code_307 = 307
    
    /// - permenantRedirect: The request and all future requests should be repeated using another URI.
    case code_308 = 308
    
    //
    // Client Error - 4xx
    //
    
    
    /// - badRequest: The server cannot or will not process the request due to an apparent client error.
    case code_400 = 400
    
    /// - unauthorized: Similar to 403 Forbidden, but specifically for use when authentication is required and has failed or has not yet been provided.
    case code_401 = 401
    
    /// - paymentRequired: The content available on the server requires payment.
    case code_402 = 402
    
    /// - forbidden: The request was a valid request, but the server is refusing to respond to it.
    case code_403 = 403
    
    /// - notFound: The requested resource could not be found but may be available in the future.
    case code_404 = 404
    
    /// - methodNotAllowed: A request method is not supported for the requested resource. e.g. a GET request on a form which requires data to be presented via POST
    case code_405 = 405
    
    /// - notAcceptable: The requested resource is capable of generating only content not acceptable according to the Accept headers sent in the request.
    case code_406 = 406
    
    /// - proxyAuthenticationRequired: The client must first authenticate itself with the proxy.
    case code_407 = 407
    
    /// - requestTimeout: The server timed out waiting for the request.
    case code_408 = 408
    
    /// - conflict: Indicates that the request could not be processed because of conflict in the request, such as an edit conflict between multiple simultaneous updates.
    case code_409 = 409
    
    /// - gone: Indicates that the resource requested is no longer available and will not be available again.
    case code_410 = 410
    
    /// - lengthRequired: The request did not specify the length of its content, which is required by the requested resource.
    case code_411 = 411
    
    /// - preconditionFailed: The server does not meet one of the preconditions that the requester put on the request.
    case code_412 = 412
    
    /// - payloadTooLarge: The request is larger than the server is willing or able to process.
    case code_413 = 413
    
    /// - URITooLong: The URI provided was too long for the server to process.
    case code_414 = 414
    
    /// - unsupportedMediaType: The request entity has a media type which the server or resource does not support.
    case code_415 = 415
    
    /// - rangeNotSatisfiable: The client has asked for a portion of the file (byte serving), but the server cannot supply that portion.
    case code_416 = 416
    
    /// - expectationFailed: The server cannot meet the requirements of the Expect request-header field.
    case code_417 = 417
    
    /// - teapot: This HTTP status is used as an Easter egg in some websites.
    case code_418 = 418
    
    /// - misdirectedRequest: The request was directed at a server that is not able to produce a response.
    case code_421 = 421
    
    /// - unprocessableEntity: The request was well-formed but was unable to be followed due to semantic errors.
    case code_422 = 422
    
    /// - locked: The resource that is being accessed is locked.
    case code_423 = 423
    
    /// - failedDependency: The request failed due to failure of a previous request (e.g., a PROPPATCH).
    case code_424 = 424
    
    /// - upgradeRequired: The client should switch to a different protocol such as TLS/1.0, given in the Upgrade header field.
    case code_426 = 426
    
    /// - preconditionRequired: The origin server requires the request to be conditional.
    case code_428 = 428
    
    /// - tooManyRequests: The user has sent too many requests in a given amount of time.
    case code_429 = 429
    
    /// - requestHeaderFieldsTooLarge: The server is unwilling to process the request because either an individual header field, or all the header fields collectively, are too large.
    case code_431 = 431
    
    /// - noResponse: Used to indicate that the server has returned no information to the client and closed the connection.
    case code_444 = 444
    
    /// - unavailableForLegalReasons: A server operator has received a legal demand to deny access to a resource or to a set of resources that includes the requested resource.
    case code_451 = 451
    
    /// - SSLCertificateError: An expansion of the 400 Bad Request response code, used when the client has provided an invalid client certificate.
    case code_495 = 495
    
    /// - SSLCertificateRequired: An expansion of the 400 Bad Request response code, used when a client certificate is required but not provided.
    case code_496 = 496
    
    /// - HTTPRequestSentToHTTPSPort: An expansion of the 400 Bad Request response code, used when the client has made a HTTP request to a port listening for HTTPS requests.
    case code_497 = 497
    
    /// - clientClosedRequest: Used when the client has closed the request before the server could send a response.
    case code_499 = 499
    
    //
    // Server Error - 5xx
    //
    
    /// - internalServerError: A generic error message, given when an unexpected condition was encountered and no more specific message is suitable.
    case code_500 = 500
    
    /// - notImplemented: The server either does not recognize the request method, or it lacks the ability to fulfill the request.
    case code_501 = 501
    
    /// - badGateway: The server was acting as a gateway or proxy and received an invalid response from the upstream server.
    case code_502 = 502
    
    /// - serviceUnavailable: The server is currently unavailable (because it is overloaded or down for maintenance). Generally, this is a temporary state.
    case code_503 = 503
    
    /// - gatewayTimeout: The server was acting as a gateway or proxy and did not receive a timely response from the upstream server.
    case code_504 = 504
    
    /// - HTTPVersionNotSupported: The server does not support the HTTP protocol version used in the request.
    case code_505 = 505
    
    /// - variantAlsoNegotiates: Transparent content negotiation for the request results in a circular reference.
    case code_506 = 506
    
    /// - insufficientStorage: The server is unable to store the representation needed to complete the request.
    case code_507 = 507
    
    /// - loopDetected: The server detected an infinite loop while processing the request.
    case code_508 = 508
    
    /// - notExtended: Further extensions to the request are required for the server to fulfill it.
    case code_510 = 510
    
    /// - networkAuthenticationRequired: The client needs to authenticate to gain network access.
    case code_511 = 511
    
    /// The class (or group) which the status code belongs to.
    var responseType: ResponseType {
        
        switch self.rawValue {
            
        case 100..<200:
            return .informational
            
        case 200..<300:
            return .success
            
        case 300..<400:
            return .redirection
            
        case 400..<500:
            return .clientError
            
        case 500..<600:
            return .serverError
            
        default:
            return .undefined
            
        }
    }
}

