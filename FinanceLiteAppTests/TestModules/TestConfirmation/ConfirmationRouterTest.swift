//
//  ConfirmationRouterTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 11.01.2023.
//

import XCTest
@testable import FinanceLiteApp

final class ConfirmationRouterTests: XCTestCase {

    func test_createModule() {
        let confirmation = ConfirmationEntity(success: true, imageName: "image", message: "message")
        let sut = ConfirmationRouter.createModule(confirmation: confirmation)
        XCTAssertNotNil(sut as? ConfirmationViewController)
    }
}
