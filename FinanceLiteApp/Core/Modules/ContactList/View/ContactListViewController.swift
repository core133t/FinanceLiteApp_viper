//
//  ContactListViewController.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

// MARK: - ContactListViewController

final class ContactListViewController: UIViewController {

    // MARK: Public Properties
    
    var presenter: ContactListPresenterProtocol?
    
    override func loadView() {
        self.view = ContactListView()
    }
}

// MARK: - ContactListPresenterDelegate

extension ContactListViewController: ContactListPresenterDelegate {
    
}
