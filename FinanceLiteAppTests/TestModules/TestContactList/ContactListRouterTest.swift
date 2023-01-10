//
//  ContactListRouterTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 10.01.2023.
//

import XCTest
@testable import FinanceLiteApp

final class ContactListRouterTests: XCTestCase {
    func test_createModule() {
        let sut = ContactListRouter.createModule()
        XCTAssertTrue(sut is ContactListViewController)
    }
}

