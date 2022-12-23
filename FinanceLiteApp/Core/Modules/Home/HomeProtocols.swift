//
//  HomeProtocols.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

protocol HomePresenterProtocol {
    var view: HomePresenterDelegate? { get set }
    var interactor: HomeInteractorProtocol { get set }
    var router: HomeRouterProtocol { get set }
    
    func viewDidLoad()
    func navigateToActivity()
    func navigateToUserProfile()
}

protocol HomeRouterProtocol {
    static func createModule() -> UIViewController
    func navigateToActivity()
    func navigateToUserProfile()
}

protocol HomeInteractorProtocol {
    var presenter: HomeInteractorDelegate? { get set }
    func didFetchData()
}
