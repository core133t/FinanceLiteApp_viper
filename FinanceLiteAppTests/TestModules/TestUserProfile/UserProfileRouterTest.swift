//
//  UserProfileRouterTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 11.01.2023.
//

import XCTest
@testable import FinanceLiteApp

final class UserProfileRouterTests: XCTestCase {

    func test_createModule() {
        let sut = UserProfileRouter.createModule()
        XCTAssertTrue(sut is UserProfileViewController)
    }

}

