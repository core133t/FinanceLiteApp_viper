//
//  HomeRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

// MARK: - HomeRouter

final class HomeRouter: HomeRouterProtocol {
    
    // MARK: Public Methods
    
    static func createModule() -> UIViewController {
        let viewController = HomeViewController()
        
        let presenter: HomePresenterProtocol & HomeInteractorDelegate = HomePresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = HomeRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = HomeInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}
