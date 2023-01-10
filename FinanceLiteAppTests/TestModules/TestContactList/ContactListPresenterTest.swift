//
//  ContactListPresenterTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 10.01.2023.
//

import XCTest
@testable import FinanceLiteApp

final class ContactListPresenterTests: XCTestCase {

    private let interactorSpy = ContactListInteractorProtocolSpy()
    private let routerSpy = ContactListRouterProtocolSpy()
    private let viewContollerSpy = ContactListPresenterDelegateSpy()
    private lazy var sut = ContactListPresenter(interactor: interactorSpy, router: routerSpy)

    override func setUp() {
        super.setUp()
        sut.view = viewContollerSpy
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(interactorSpy.fetchDataCalled)
    }

    func test_didFetchData() {
        sut.didFetchData(contactList: [])
        XCTAssertTrue(viewContollerSpy.showDataCalled)
    }
}

enum ContactListErrorMock: Error {
    case generic
}

final class ContactListPresenterDelegateSpy: ContactListPresenterDelegate {

    private(set) var showDataCalled = false
    func showData(_ contactList: [ContactEntity]) {
        showDataCalled = true
    }

    private(set) var showErrorCalled = false
    func showError(_ error: Error) {
        showErrorCalled = true
    }

}

