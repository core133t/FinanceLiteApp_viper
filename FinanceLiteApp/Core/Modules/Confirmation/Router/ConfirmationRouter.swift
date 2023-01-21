//
//  ConfirmationRouter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import UIKit

typealias ConfirmationInterable = ConfirmationPresenterProtocol

final class ConfirmationRouter: ConfirmationRouterProtocol {
    
    weak var viewController: UIViewController?

    static func createModule(confirmation: ConfirmationEntity) -> UIViewController {
        let router = ConfirmationRouter()

        var presenter: ConfirmationInterable = ConfirmationPresenter(
            router: router,
            confirmation: confirmation
        )

        let viewController = ConfirmationViewController(presenter: presenter)
        router.viewController = viewController
        presenter.view = viewController

        return viewController
    }

}
