//
//  ContactListInteractorTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 10.01.2023.
//

import XCTest
@testable import FinanceLiteApp

final class ContactListInteractorTests: XCTestCase {
    private let presenterSpy = ContactListInteractorDelegateSpy()
    private let serviceSpy = FinanceServiceProtocolSpy()
    private lazy var sut = ContactListInteractor(service: serviceSpy)

    override func setUp() {
        sut.presenter = presenterSpy
    }

    func test_fetchData_returned_success() {
        serviceSpy.requestResultToBeReturned = [ContactEntity(name: "", phone: "")]
        sut.fetchData()
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }

    func test_fetchData_returned_error() {
        sut.fetchData()
        XCTAssertFalse(presenterSpy.didFetchDataCalled)
    }
}

final class ContactListInteractorDelegateSpy: ContactListInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData(contactList: [ContactEntity]) {
        didFetchDataCalled = true
    }

}
