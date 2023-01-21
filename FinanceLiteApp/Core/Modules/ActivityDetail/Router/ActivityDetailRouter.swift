//
//  ActivityDetailRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

typealias ActivityDetailsInterable = ActivityDetailsPresenterProtocol & ActivityDetailsInteractorDelegate

final class ActivityDetailsRouter: ActivityDetailsRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule(activity: ActivityEntity) -> UIViewController {
        //let service = FinanceService()
        let interactor = ActivityDetailsInteractor(activity: activity)
        let router = ActivityDetailsRouter()
        var presenter: ActivityDetailsInterable = ActivityDetailsPresenter(
            interactor: interactor,
            router: router
        )
            
        let viewController: ActivityDetailsViewController = ActivityDetailsViewController(presenter: presenter)
        router.viewController = viewController
        presenter.view = viewController
        interactor.presenter = presenter
            
        return viewController
    }
}
