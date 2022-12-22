//
//  ContactListProtocols.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

// MARK: - ContactListPresenterProtocol

protocol ContactListPresenterProtocol {
    var view: ContactListPresenterDelegate? { get set }
    var interactor: ContactListInteractorProtocol? { get set }
    var router: ContactListRouterProtocol? { get set }
    
    func viewDidLoad()
}

// MARK: - ContactListRouterProtocol

protocol ContactListRouterProtocol {
    static func createModule() -> UIViewController
}

// MARK: - ContactListInteractorProtocol

protocol ContactListInteractorProtocol {
    var presenter: ContactListInteractorDelegate? { get set }
    
    func fetchData()
}

