//
//  ContactListInteractor.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

// MARK: - ContactListInteractorDelegate

protocol ContactListInteractorDelegate: AnyObject {
    
}

// MARK: - ContactListInteractor

final class ContactListInteractor: ContactListInteractorProtocol {

    // MARK: Public Properties

    weak var presenter: ContactListInteractorDelegate?

    // MARK: Public Functions

    func fetchData() {
        // TODO
    }
}

