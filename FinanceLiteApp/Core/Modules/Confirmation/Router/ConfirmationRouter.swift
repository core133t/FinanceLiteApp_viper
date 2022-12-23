//
//  ConfirmationRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import UIKit

typealias ConfirmationInterable = ConfirmationPresenterProtocol

final class ConfirmationRouter: ConfirmationRouterProtocol {

    static func createModule(confirmation: ConfirmationEntity) -> UIViewController {
        let router: ConfirmationRouterProtocol = ConfirmationRouter()

        let presenter: ConfirmationInterable = ConfirmationPresenter(
            router: router,
            confirmation: confirmation
        )

        let viewController = ConfirmationViewController(presenter: presenter)
        viewController.presenter.view = viewController

        return viewController
    }

}
