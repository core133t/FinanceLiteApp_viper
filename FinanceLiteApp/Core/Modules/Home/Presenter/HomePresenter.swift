//
//  HomePresenter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol HomePresenterDelegate: AnyObject {
    func showData()
}

final class HomePresenter: HomePresenterProtocol {
    
    // MARK: Properties
    weak var view: HomePresenterDelegate?
    var interactor: HomeInteractorProtocol
    var router: HomeRouterProtocol
    
    // MARK: Init
    init(
        interactor: HomeInteractorProtocol,
        router: HomeRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.didFetchData()
    }
    
    func navigateToActivity() {
        router.navigateToActivity()
    }
    
    func navigateToUserProfile() {
        router.navigateToUserProfile()
    }

}

// MARK: Extensions
extension HomePresenter: HomeInteractorDelegate {
    func didFetchData() {
        view?.showData()
    }
}
