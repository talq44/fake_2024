//
//  LookupResultDTO.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

public struct LookupResultDTO: Decodable {
    /// 앱의 스크린샷 URL 리스트
    public let screenshotUrls: [String]?
    /// 앱 아이콘 (60x60 크기)
    public let artworkUrl60: String?
    /// 앱 아이콘 (512x512 크기)
    public let artworkUrl512: String?
    /// 앱 아이콘 (100x100 크기)
    public let artworkUrl100: String?
    /// 개발자 프로필 URL
    public let artistViewUrl: String?
    /// 앱에 적용된 권고사항 리스트 (예: 연령제한)
    public let advisories: [String]
    /// 앱 종류 (예: software)
    public let kind: String?
    /// 현재 버전에 대한 사용자 평가 수
    public let userRatingCountForCurrentVersion: Int?
    /// 최소 iOS 지원 버전
    public let minimumOsVersion: String
    /// 현재 버전의 사용자 평균 평가 점수
    public let averageUserRatingForCurrentVersion: Double?
    /// 판매자 URL
    public let sellerUrl: String?
    /// 전체 사용자 평균 평가 점수
    public let averageUserRating: Double?
    /// 트랙 이름 (앱 이름)
    public let trackCensoredName: String
    /// 지원 언어 리스트 (ISO 2자리 코드)
    public let languageCodesISO2A: [String]
    /// 파일 크기 (바이트 단위)
    public let fileSizeBytes: String
    /// 가격 (예: 무료)
    public let formattedPrice: String
    /// 콘텐츠 등급 (예: 4+)
    public let contentAdvisoryRating: String
    /// 앱 스토어 URL
    public let trackViewUrl: String
    /// 앱 등급 콘텐츠 설명
    public let trackContentRating: String
    /// 번들 ID
    public let bundleId: String
    /// 개발자 ID
    public let artistId: Int
    /// 개발자 이름
    public let artistName: String
    /// 앱 장르 (예: 금융)
    public let genres: [String]
    /// 앱 가격 (0.0 = 무료)
    public let price: Double
    /// 판매자 이름
    public let sellerName: String
    /// 앱 출시일
    public let releaseDate: String
    /// 앱 장르 ID
    public let genreIds: [String]
    /// 트랙 ID (앱 ID)
    public let trackId: Int
    /// 앱 이름
    public let trackName: String
    /// VPP 디바이스 기반 라이선싱 활성화 여부
    public let isVppDeviceBasedLicensingEnabled: Bool
    /// 주 장르 이름
    public let primaryGenreName: String
    /// 주 장르 ID
    public let primaryGenreId: Int
    /// 현재 버전 릴리즈 날짜
    public let currentVersionReleaseDate: String
    /// 릴리즈 노트
    public let releaseNotes: String?
    /// 현재 버전
    public let version: String
    /// 래퍼 타입 (예: software)
    public let wrapperType: String
    /// 화폐 단위 (예: USD)
    public let currency: String
    /// 앱 설명
    public let description: String
    /// 사용자 평가 수
    public let userRatingCount: Int
}
