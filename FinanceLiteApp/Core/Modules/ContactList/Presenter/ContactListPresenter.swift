//
//  ContactListPresenter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

// MARK: - ContactListPresenterDelegate

protocol ContactListPresenterDelegate: AnyObject {
    
}

// MARK: - ContactListPresenter

final class ContactListPresenter: ContactListPresenterProtocol {
    
    // MARK: Public Properties
    
    weak var view: ContactListPresenterDelegate?
    var interactor: ContactListInteractorProtocol?
    var router: ContactListRouterProtocol?
    
    // MARK: Public Methods

    func viewDidLoad() {
        
    }
}

// MARK: - ContactListInteractorDelegate
extension ContactListPresenter: ContactListInteractorDelegate {
    
}

