//
//  UserProfilePresenterTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 11.01.2023.
//


import XCTest
@testable import FinanceLiteApp

final class UserProfilePresenterTests: XCTestCase {

    private let interactorSpy = UserProfileInteractorProtocolSpy()
    private let routerSpy = UserProfileRouterProtocolSpy()
    private let viewContollerSpy = UserProfilePresenterDelegateSpy()
    private lazy var sut = UserProfilePresenter(interactor: interactorSpy, router: routerSpy)

    override func setUp() {
        super.setUp()
        sut.view = viewContollerSpy
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(interactorSpy.fetchDataCalled)
    }

    func test_didFetchData() {
        sut.didFetchData(UserEntity(name: "name",
                                    phone: "phone",
                                    email: "email",
                                    address: "address",
                                    account: AccountEntity(agency: "agency", account: "account")))
        XCTAssertTrue(viewContollerSpy.showDataCalled)
    }
}

final class UserProfilePresenterDelegateSpy: UserProfilePresenterDelegate {
    private(set) var showDataCalled = false
    func showData() {
        showDataCalled = true
    }
}
