//
//  TransferInteractorTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import XCTest
@testable import FinanceLiteApp

final class TransfersInteractorTests: XCTestCase {
    private let presenterSpy = TransfersInteractorDelegateSpy()
    private let serviceSpy = FinanceServiceProtocolSpy()
    private lazy var sut = TransfersInteractor(service: serviceSpy)

    override func setUp() {
        sut.presenter = presenterSpy
    }

    func test_transfer_returned_sucess() {
        serviceSpy.requestResultToBeReturned = TransfersEntity(success: true)
        sut.transfer(value: "value")
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }

    func test_transfer_returned_failure() {
        sut.transfer(value: "value")
        XCTAssertFalse(presenterSpy.didFetchDataCalled)
    }
}

final class TransfersInteractorDelegateSpy: TransfersInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData(transfer: TransfersEntity) {
        didFetchDataCalled = true
    }

    private(set) var didReceiveErrorCalled = false
    func didReceiveError(error: Error) {
        didReceiveErrorCalled = true
    }

}

final class ContactListInteractorDelegateSpy: ContactListInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData(contactList: [ContactEntity]) {
        didFetchDataCalled = true
    }

}

final class FinanceServiceProtocolSpy: FinanceServiceProtocol {

    var requestResultToBeReturned: Any?

    func load<T>(endpoint: FinanceEndpoint, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        guard let requestResultToBeReturned = requestResultToBeReturned as? T else {
            completion(.failure(ErrorSpy.generic))
            return
        }

        completion(.success(requestResultToBeReturned))
    }

    private(set) var cancelCalled = false
    func cancel() {
        cancelCalled = true
    }

}

enum ErrorSpy: Error {
    case generic
}
