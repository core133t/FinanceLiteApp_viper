//
//  SplashPresenter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol SplashPresenterProtocol: AnyObject {
    func viewDidAppear()
    func routeToList()
}

final class SplashPresenter: SplashPresenterProtocol {
    
    unowned var view: SplashViewControllerProtocol!
    let router: SplashRouterProtocol!
    let interactor: SplashInteractorProtocol!
    
    init(view: SplashViewControllerProtocol, router: SplashRouterProtocol, interactor: SplashInteractorProtocol ) {
        self.view = view
        self.router = router
        self.interactor = interactor
    }
    
    func viewDidAppear() {
        interactor.checkInternetConnection()
    }
    
    func routeToList() {
        router.navigate(.listScreen)
    }
    
}


extension SplashPresenter: SplashInteractorOutputProtocol {
    
    func internetConnection(status: Bool) {
        if status {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.routeToList()
            }
        } else {
            view.noInternetConnection()
        }
    }
}

