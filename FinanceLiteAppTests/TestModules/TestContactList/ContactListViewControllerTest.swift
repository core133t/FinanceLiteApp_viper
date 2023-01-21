//
//  ContactListViewControllerTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 10.01.2023.
//

import XCTest
@testable import FinanceLiteApp

final class ContactListViewControllerTests: XCTestCase {
    private let presenterSpy = ContactListPresenterProtocolSpy()
    private lazy var sut = ContactListViewController(presenter: presenterSpy)

    func test_loadView() {
        sut.loadView()
        XCTAssertFalse(presenterSpy.viewDidLoadCalled)
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(presenterSpy.viewDidLoadCalled)
    }

    func test_showData() {
        XCTAssertEqual(sut.contactList.count, 0)

        sut.showData([ContactEntityNew()])

        XCTAssertEqual(sut.contactList.count, 1)
    }

}

final class ContactListPresenterProtocolSpy: ContactListPresenterProtocol {
    var view: ContactListPresenterDelegate?

    var interactor: ContactListInteractorProtocol = ContactListInteractorProtocolSpy()
    var router: ContactListRouterProtocol = ContactListRouterProtocolSpy()

    private(set) var viewDidLoadCalled = false
    func viewDidLoad() {
        viewDidLoadCalled = true
    }

}

final class ContactListInteractorProtocolSpy: ContactListInteractorProtocol {
    var presenter: ContactListInteractorDelegate?

    private(set) var fetchDataCalled = false
    func fetchData() {
        fetchDataCalled = true
    }
}

final class ContactListRouterProtocolSpy: ContactListRouterProtocol {
    static func createModule() -> UIViewController {
        return UIViewController()
    }
}
