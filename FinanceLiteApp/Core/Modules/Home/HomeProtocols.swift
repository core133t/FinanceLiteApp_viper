//
//  HomeProtocols.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

// MARK: - HomePresenterProtocol

protocol HomePresenterProtocol {
    var view: HomePresenterDelegate? { get set }
    var interactor: HomeIteractorProtocol? { get set }
    var router: HomeRouterProtocol? { get set }
    
    func viewDidLoad()
}

// MARK: - HomeRouterProtocol

protocol HomeRouterProtocol {
    static func createModule() -> UIViewController
}

// MARK: - HomeIteractorProtocol

protocol HomeIteractorProtocol {
    var presenter: HomeInteractorDelegate? { get set }
    
    func fetchData()
}
