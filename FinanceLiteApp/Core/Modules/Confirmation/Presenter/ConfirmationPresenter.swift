//
//  ConfirmationPresenter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import Foundation

protocol ConfirmationPresenterDelegate: AnyObject {
    func showData(confirmation: ConfirmationEntity)
}

final class ConfirmationPresenter: ConfirmationPresenterProtocol {

    weak var view: ConfirmationPresenterDelegate?
    var router: ConfirmationRouterProtocol
    var confirmation: ConfirmationEntity

    init(router: ConfirmationRouterProtocol, confirmation: ConfirmationEntity) {
        self.router = router
        self.confirmation = confirmation
    }

    func viewDidLoad() {
        view?.showData(confirmation: confirmation)
    }
}
