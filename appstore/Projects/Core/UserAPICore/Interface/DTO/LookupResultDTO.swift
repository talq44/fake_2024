//
//  LookupResultDTO.swift
//  API
//
//  Created by 박창규 on 2023/09/17.
//

import Foundation

public struct LookupResultDTO: Decodable {
    public let artworkUrl60: String?
    public let artworkUrl512: String?
    public let artworkUrl100: String?
    
    public let screenshotUrls: [String]
    public let trackCensoredName: String
    /// 3.07272999999999996134647517465054988861083984375
    public let averageUserRating: Double
    /// 3.07272999999999996134647517465054988861083984375,
    public let averageUserRatingForCurrentVersion: Double
    
    public let userRatingCount: Int
    /// "4+"
    public let trackContentRating: String
    /// "● 전월세보증금 대출 갈아타기 출시 (9/13 오픈)\n- 기존 대출 해지 없이 새로운 전월세보증금 대출을 조회하고 갈아탈 수 있어요.\n- 살고 있는 집의 보증금이 오르거나 이사를 가는 경우에도 신청이 가능해요.\n\n● 사용성 개선\n- 더욱 편리한 서비스 제공을 위해 기능 개선 및 불편점 해소 작업도 함께 진행했어요."
    public let releaseNotes: String
    /// "KakaoBank Corp."
    public let artistName: String
    
    public let description: String
    
    public let sellerName: String
    /// "카카오뱅크"
    public let trackName: String
    
    public let languageCodesISO2A: [String]
    
    public let genres: [String]
}
