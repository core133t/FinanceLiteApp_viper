//
//  HomeInteractorTests.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import XCTest
@testable import FinanceLiteApp

final class HomeInteractorTests: XCTestCase {
    private let presenterSpy = HomeInteractorDelegateSpy()
    private let sut = HomeInteractor()

    override func setUp() {
        sut.presenter = presenterSpy
    }

    func test_didFetchData() {
        sut.didFetchData()
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }
}

final class HomeInteractorDelegateSpy: HomeInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData() {
        didFetchDataCalled = true
    }

}
