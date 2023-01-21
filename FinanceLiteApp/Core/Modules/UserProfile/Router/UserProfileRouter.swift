//
//  UserProfileRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import UIKit

typealias UserProfileInterable = UserProfilePresenterProtocol & UserProfileInteractorDelegate

final class UserProfileRouter: UserProfileRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let service = FinanceService()
        let interactor = UserProfileInteractor(service: service)
        let router = UserProfileRouter()
        var presenter: UserProfileInterable = UserProfilePresenter(
            interactor: interactor,
            router: router
        )
        
        let viewController: UserProfileViewController = UserProfileViewController(presenter: presenter)
        router.viewController = viewController
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
}
