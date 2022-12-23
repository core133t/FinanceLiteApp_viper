//
//  ContactListRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

typealias ContactListInterable = ContactListPresenterProtocol & ContactListInteractorDelegate

final class ContactListRouter: ContactListRouterProtocol {
    
    static func createModule() -> UIViewController {
        let service = FinanceService()
        let interactor = ContactListInteractor(service: service)
        let router = ContactListRouter()
        let presenter: ContactListInterable = ContactListPresenter(
            interactor: interactor,
            router: router
        )
        
        let viewController = ContactListViewController(presenter: presenter)
        viewController.presenter.view = viewController
        viewController.presenter.interactor.presenter = presenter
        
        return viewController
    }
    
}
