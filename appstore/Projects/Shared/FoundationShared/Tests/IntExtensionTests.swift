//
//  IntExtensionTests.swift
//  FoundationSharedTests
//
//  Created by 박창규 on 11/26/24.
//

import XCTest

import FoundationShared

final class IntExtensionTests: XCTestCase {

    override func setUpWithError() throws { }

    override func tearDownWithError() throws { }

    func test_g_1자리에서_3자리직전_w_decimalFormat_t_콤마가없어야합니다() throws {
        // given
        let value = Int.random(in: 1..<1000)
        // when
        let result = value.decimalFormat
        // then
        let commaCount = result.filter { $0 == "," }.count
        XCTAssertTrue(commaCount == 0)
    }
    
    func test_g_3자리에서_6자리직전_w_decimalFormat_t_콤마가1개포함되어야합니다() throws {
        // given
        let value = Int.random(in: 1000..<1000000)
        // when
        let result = value.decimalFormat
        // then
        let commaCount = result.filter { $0 == "," }.count
        XCTAssertTrue(commaCount == 1)
    }
    
    func test_g_6자리에서_9자리직전_w_decimalFormat_t_콤마가2개포함되어야합니다() throws {
        // given
        let value = Int.random(in: 1000000..<1000000000)
        // when
        let result = value.decimalFormat
        // then
        let commaCount = result.filter { $0 == "," }.count
        XCTAssertTrue(commaCount == 2)
    }
    
    func test_g_1자리에서_3자리직전_w_koreanNumberFormat_t_숫자값만존재해야합니다() throws {
        // given
        let value = Int.random(in: 1..<1000)
        // when
        let result = value.koreanNumberFormat
        // then
        let intConvert = Int(result)
        XCTAssertTrue(intConvert != nil)
    }
    
    func test_g_3자리에서_4자리직전_w_koreanNumberFormat_t_천글자와닷이있어야합니다() throws {
        // given
        let value = Int.random(in: 1000..<10000)
        // when
        let result = value.koreanNumberFormat
        // then
        let has천 = result.contains("천")
        let has닷 = result.contains(".")
        XCTAssertTrue(has천 && has닷)
    }
    
    func test_g_4자리에서_8자리직전_w_koreanNumberFormat_t_만글자와닷이있어야합니다() throws {
        // given
        let value = Int.random(in: 10000..<100000000)
        // when
        let result = value.koreanNumberFormat
        // then
        let has만 = result.contains("만")
        let has닷 = result.contains(".")
        XCTAssertTrue(has만 && has닷)
    }
    
    func test_g_8자리에서_12자리직전_w_koreanNumberFormat_t_억글자와닷이있어야합니다() throws {
        // given
        let value = Int.random(in: 100000000..<1000000000000)
        // when
        let result = value.koreanNumberFormat
        // then
        let has억 = result.contains("억")
        let has닷 = result.contains(".")
        XCTAssertTrue(has억 && has닷)
    }
}
