//
//  HomeInteractorTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 22.01.2023.
//

import XCTest
@testable import FinanceLiteApp

final class HomeInteractorTests: XCTestCase {
    private let presenterSpy = HomeInteractorDelegateSpy()
    private let serviceSpy = FinanceServiceProtocolSpy()
    private lazy var sut = HomeInteractor(service: serviceSpy)

    override func setUp() {
        sut.presenter = presenterSpy
    }

    func test_didFetchData() {
        let activity = [ActivityEntity]()
        sut.presenter?.didFetchData(activityList: HomeEntity(balance: 1, savings: 1, spending: 1, listActivity: activity))
        XCTAssertTrue(presenterSpy.didFetchDataCalled)
    }
}

final class HomeInteractorDelegateSpy: HomeInteractorDelegate {

    private(set) var didFetchDataCalled = false
    func didFetchData(activityList: HomeEntity) {
        didFetchDataCalled = true
    }

}

