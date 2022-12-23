//
//  HomeRouterTests.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import XCTest
@testable import FinanceLiteApp

final class HomeRouterTests: XCTestCase {

    func test_createModule() {
        let sut = HomeRouter.createModule()
        XCTAssertTrue(sut is HomeViewController)
    }
}

