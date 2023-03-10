//
//  HomeRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

typealias HomeInterable = HomePresenterProtocol & HomeInteractorDelegate

final class HomeRouter: HomeRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let service = FinanceService()
        let interactor = HomeInteractor(service: service)
        let router = HomeRouter()
        var presenter: HomeInterable = HomePresenter(
            interactor: interactor,
            router: router
        )
         
        let viewController: HomeViewController = HomeViewController(presenter: presenter)
        router.viewController = viewController
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
    func navigateToActivity(activity: ActivityEntity) {
        let viewController = ActivityDetailsRouter.createModule(activity: activity)
        self.viewController?.show(viewController, sender: self)
    }
    
    func navigateToUserProfile() {
        let viewController = UserProfileRouter.createModule()
        self.viewController?.showDetailViewController(viewController, sender: self)
    }

}
