//
//  ActivityDetailRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

// MARK: - ActivityDetailsRouter

final class ActivityDetailsRouter: ActivityDetailsRouterProtocol {
    
    // MARK: Public Methods

    static func createModule() -> UIViewController {
        let viewController = ActivityDetailsViewController()

        let presenter: ActivityDetailsPresenterProtocol & ActivityDetailsInteractorDelegate = ActivityDetailsPresenter()

        viewController.presenter = presenter
        viewController.presenter?.router = ActivityDetailsRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = ActivityDetailsInteractor()
        viewController.presenter?.interactor?.presenter = presenter

        return viewController
    }
}
