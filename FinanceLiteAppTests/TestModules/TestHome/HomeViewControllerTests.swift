//
//  HomeViewControllerTests.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import XCTest
@testable import FinanceLiteApp

final class HomeViewControllerTests: XCTestCase {

    private let presenterSpy = HomePresenterProtocolSpy()
    private lazy var navigationControllerSpy = NavigationControllerSpy()
    private lazy var sut = HomeViewController(presenter: presenterSpy)

    func test_loadView() {
        sut.loadView()
        XCTAssertFalse(presenterSpy.viewDidLoadCalled)
    }

    func test_viewDidLoad() {
        sut.viewDidLoad()
        XCTAssertTrue(presenterSpy.viewDidLoadCalled)
    }
}

final class HomePresenterProtocolSpy: HomePresenterProtocol {
    func navigateToActivity() {
    }
    
    func navigateToUserProfile() {
    }
    

    var view: HomePresenterDelegate?
    var interactor: HomeInteractorProtocol = HomeInteractorProtocolSpy()
    var router: HomeRouterProtocol = HomeRouterProtocolSpy()

    private(set) var viewDidLoadCalled = false
    func viewDidLoad() {
        viewDidLoadCalled = true
    }

}

final class HomeInteractorProtocolSpy: HomeInteractorProtocol {

    var presenter: HomeInteractorDelegate?

    private(set) var didFetchDataCalled = false
    func didFetchData() {
        didFetchDataCalled = true
    }

}
final class HomeRouterProtocolSpy: HomeRouterProtocol {
    func navigateToActivity() {
    }
    
    func navigateToUserProfile() {
    }
    
    static func createModule() -> UIViewController {
        return UIViewController()
    }
}

final class NavigationControllerSpy: UINavigationController {

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        nil
    }

    private(set) var pushViewControllerCalled = false
    private(set) var pushViewControllerPassed: UIViewController?
    private(set) var pushViewControllerAnimatedPassed: Bool?
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        pushViewControllerCalled = true
        pushViewControllerPassed = viewController
        pushViewControllerAnimatedPassed = animated
    }
}
