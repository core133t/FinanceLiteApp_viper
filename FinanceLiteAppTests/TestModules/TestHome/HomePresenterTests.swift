//
//  HomeTests.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import XCTest
@testable import FinanceLiteApp

final class HomePresenterTests: XCTestCase {

    private let viewContollerSpy = HomePresenterDelegateSpy()
    private let interactorSpy = HomeInteractorProtocolSpy()
    private let routerSpy = HomeRouterProtocolSpy()
    private lazy var sut = HomePresenter(interactor: interactorSpy, router: routerSpy)

    override func setUp() {
        super.setUp()
        sut.view = viewContollerSpy
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(interactorSpy.didFetchDataCalled)
    }

    func test_didFetchData() {
        sut.didFetchData()
        XCTAssertTrue(viewContollerSpy.showDataCalled)
    }
}

final class HomePresenterDelegateSpy: HomePresenterDelegate {

    private(set) var showDataCalled = false
    func showData() {
        showDataCalled = true
    }
    
}
