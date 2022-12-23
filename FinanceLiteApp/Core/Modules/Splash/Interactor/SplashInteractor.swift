//
//  SplashInteractor.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol SplashInteractorProtocol: AnyObject {
    func checkInternetConnection()
}

protocol SplashInteractorOutputProtocol: AnyObject {
    
}

final class SplashInteractor {
    var output: SplashInteractorOutputProtocol?
}

extension SplashInteractor: SplashInteractorProtocol {
    func checkInternetConnection() {
    }
    
    

}

