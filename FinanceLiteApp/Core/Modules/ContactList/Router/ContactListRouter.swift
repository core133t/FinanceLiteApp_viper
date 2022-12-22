//
//  ContactListRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

// MARK: ContactListRouter

final class ContactListRouter: ContactListRouterProtocol {
    
    // MARK: Public Methods

    static func createModule() -> UIViewController {
        let viewController = ContactListViewController()
        
        let presenter: ContactListPresenterProtocol & ContactListInteractorDelegate = ContactListPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = ContactListRouter()
        viewController.presenter?.view = ContactListViewController()
        viewController.presenter?.interactor = ContactListInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
}

