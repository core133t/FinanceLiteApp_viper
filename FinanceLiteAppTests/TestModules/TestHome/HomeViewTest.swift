//
//  HomeViewTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 11.01.2023.
//

import XCTest
@testable import FinanceLiteApp

final class HomeViewTests: XCTestCase {

    private let homeViewDelegateSpy = HomeViewDelegateSpy()
    private let sut = HomeView()

    override func setUp() {
        super.setUp()
        sut.delegate = homeViewDelegateSpy
    }
    
    func test_didSelectedActivity() {
        sut.didSelectedActivity(activity: ActivityEntity(name: "name", price: 1, time: "time", imageTag: "image"))
                                
        XCTAssertTrue(homeViewDelegateSpy.didSelectActivityCalled)
    }
}

final class HomeViewDelegateSpy: HomeViewDelegate {

    private(set) var didSelectActivityCalled = false
    
    func didSelectActivity(activity: ActivityEntity) {
        didSelectActivityCalled = true
    }

}
