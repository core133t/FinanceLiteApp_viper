//
//  ActivityDetailProtocols.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

protocol ActivityDetailsPresenterProtocol {
    
    var view: ActivityDetailsPresenterDelegate? { get set }
    var interactor: ActivityDetailsInteractorProtocol {get set}
    var router: ActivityDetailsRouterProtocol { get set }
    
    func viewDidLoad()
}

protocol ActivityDetailsRouterProtocol {
    
    static func createModule() -> UIViewController
}

protocol ActivityDetailsInteractorProtocol {
    
    var presenter: ActivityDetailsInteractorDelegate? { get set }
    
    func fetchData()
}
