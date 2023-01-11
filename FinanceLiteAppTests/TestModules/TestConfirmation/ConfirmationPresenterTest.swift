//
//  ConfirmationPresenterTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 11.01.2023.
//

import XCTest
@testable import FinanceLiteApp

final class ConfirmationPresenterTests: XCTestCase {

    private let viewContollerSpy = ConfirmationPresenterDelegateSpy()
    private let routerSpy = ConfirmationRouterProtocolSpy()
    private lazy var sut = ConfirmationPresenter(router: routerSpy,
                                                 confirmation: ConfirmationEntity(success: true, imageName: "image", message: "message"))

    override func setUp() {
        super.setUp()
        sut.view = viewContollerSpy
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(viewContollerSpy.showDataCalled)
    }
}

final class ConfirmationPresenterDelegateSpy: ConfirmationPresenterDelegate {

    private(set) var showDataCalled = true
    func showData(confirmation: ConfirmationEntity) {
        showDataCalled = true
    }

}

final class ConfirmationRouterProtocolSpy: ConfirmationRouterProtocol {

    static func createModule(confirmation: ConfirmationEntity) -> UIViewController {
        return UIViewController()
    }

}

