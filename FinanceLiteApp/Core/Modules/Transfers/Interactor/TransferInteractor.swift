//
//  TransferInteractor.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol TransferInteractorDelegate: AnyObject {
}

class TransferInteractor: TransferInteractorProtocol {

    weak var presenter: TransferInteractorDelegate?
}

