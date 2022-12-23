//
//  ActivityDetailRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

typealias ActivityDetailsInterable = ActivityDetailsPresenterProtocol & ActivityDetailsInteractorDelegate

final class ActivityDetailsRouter: ActivityDetailsRouterProtocol {
    
    static func createModule() -> UIViewController {
        
        let interactor: ActivityDetailsInteractorProtocol = ActivityDetailsInteractor()
        
        let router: ActivityDetailsRouterProtocol = ActivityDetailsRouter()
        
        let presenter: ActivityDetailsInterable = ActivityDetailsPresenter(interactor: interactor, router: router)

        let viewController = ActivityDetailsViewController(presenter: presenter)
        
        viewController.presenter.view = viewController
        viewController.presenter.interactor.presenter = presenter
        
        return viewController
    }
}
