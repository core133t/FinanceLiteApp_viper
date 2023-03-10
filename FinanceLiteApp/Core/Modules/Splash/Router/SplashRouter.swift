//
//  SplashRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

protocol SplashRouterProtocol: AnyObject {
    func navigate(_ route: SplashRoutes)
}

enum SplashRoutes {
    case listScreen
}

final class SplashRouter {

    weak var viewController: SplashViewController?
    
    static func createModule() -> SplashViewController {
        let view = SplashViewController()
        let interactor = SplashInteractor()
        let router = SplashRouter()
        let presenter = SplashPresenter(view: view, router: router, interactor: interactor)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
}

extension SplashRouter: SplashRouterProtocol {
    
    func navigate(_ route: SplashRoutes) {
        switch route {
        case .listScreen:
            guard let window = viewController?.view.window else { return }
            let listVC = TabBarController()
            let navigationController = UINavigationController(rootViewController: listVC)
            navigationController.isNavigationBarHidden = true // delete if you need white bar in the top of home view
            window.rootViewController = navigationController
        }
    }
}
