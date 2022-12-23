//
//  UserProfileProtocols.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import UIKit

protocol UserProfilePresenterProtocol {
    var view: UserProfilePresenterDelegate? { get set }
    var interactor: UserProfileInteractorProtocol { get set }
    var router: UserProfileRouterProtocol { get set }
    
    func viewDidLoad()
}

protocol UserProfileRouterProtocol {
    static func createModule() -> UIViewController
}

protocol UserProfileInteractorProtocol {
    var presenter: UserProfileInteractorDelegate? { get set }
    func fetchData()
}
