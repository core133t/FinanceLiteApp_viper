//
//  UserProfilePresenter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import Foundation

protocol UserProfilePresenterDelegate: AnyObject {
    func showData()
}

final class UserProfilePresenter: UserProfilePresenterProtocol {
    
    weak var view: UserProfilePresenterDelegate?
    var interactor: UserProfileInteractorProtocol
    var router: UserProfileRouterProtocol
    
    init(
        interactor: UserProfileInteractorProtocol,
        router: UserProfileRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
        
    func viewDidLoad() {
        interactor.fetchData()
    }
}

extension UserProfilePresenter: UserProfileInteractorDelegate {

    func didFetchData(_ userProfile: UserEntity) {
        view?.showData()
    }

}
