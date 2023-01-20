//
//  ContactListRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

typealias ContactListInterable = ContactListPresenterProtocol & ContactListInteractorDelegate

final class ContactListRouter: ContactListRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let service = FinanceService()
        let interactor = ContactListInteractor(service: service)
        let router = ContactListRouter()
        var presenter: ContactListInterable = ContactListPresenter(
            interactor: interactor,
            router: router
        )
        
        let viewController: ContactListViewController = ContactListViewController(presenter: presenter)
        router.viewController = viewController
        presenter.view = viewController
        interactor.presenter = presenter
        
        return viewController
    }
    
}
