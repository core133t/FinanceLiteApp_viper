//
//  ConfirmationProtocols.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import UIKit

protocol ConfirmationPresenterProtocol {
    var view: ConfirmationPresenterDelegate? { get set }
    var router: ConfirmationRouterProtocol { get set }
    var confirmation: ConfirmationEntity { get set }

    func viewDidLoad()
}

protocol ConfirmationRouterProtocol {
    static func createModule(confirmation: ConfirmationEntity) -> UIViewController
}

protocol ConfirmationInteractorProtocol {
    func fetchData()
}
