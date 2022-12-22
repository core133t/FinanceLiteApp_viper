//
//  TransferPresenter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import UIKit

protocol TransferPresenterDelegate: AnyObject {

    func showData()
}

class TransferPresenter: TransferPresenterProtocol {
    
    weak var view: TransferPresenterDelegate?
    var interactor: TransferInteractorProtocol?
    var router: TransferRouterProtocol?
    
    
    func didPressChooseContactButton(controller: UIViewController) {
        router?.navigateToChooseContacts(controller: controller)
    }
    
    func didPressTransferButton(controller: UIViewController) {
        router?.navigateToTransfer(controller: controller)
    }

}

extension TransferPresenter: TransferInteractorDelegate {

    func didFetchData() {

        view?.showData()
    }
}
