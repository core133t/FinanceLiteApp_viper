//
//  TransferProtocols.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

protocol TransfersPresenterProtocol {
    var view: TransfersPresenterDelegate? { get set }
    
    func didTapTransfer(value: String)
    func navigateToContactList()
    func navigateToConfirmation(confirmation: ConfirmationEntity)
}

protocol TransfersInteractorProtocol {
    var presenter: TransfersInteractorDelegate? { get set }
    func transfer(value: String)
}

protocol TransfersRouterProtocol {
    static func createModule() -> UIViewController
    func navigateToContactList()
    func navigateToConfirmation(confirmation: ConfirmationEntity)
}
