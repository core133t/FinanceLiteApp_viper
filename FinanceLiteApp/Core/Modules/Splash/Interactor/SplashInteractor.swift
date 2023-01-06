//
//  SplashInteractor.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol SplashInteractorProtocol: AnyObject {
    var presenter: SplashInteractorDelegate? { get set }
    func didFetchData()
}

protocol SplashInteractorDelegate: AnyObject {
    func fetchData()
}

final class SplashInteractor:SplashInteractorProtocol {
    var presenter: SplashInteractorDelegate?
    
    func didFetchData() {
        self.presenter?.fetchData()
    }
}

