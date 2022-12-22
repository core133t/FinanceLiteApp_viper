//
//  HomePresenter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

// MARK: - HomePresenterDelegate

protocol HomePresenterDelegate: AnyObject {
    func showError(message: String)
    func showData(homeData: HomeData)
}

// MARK: - HomePresenter

final class HomePresenter: HomePresenterProtocol {
    
    // MARK: Public Properties

    weak var view: HomePresenterDelegate?
    var interactor: HomeIteractorProtocol?
    var router: HomeRouterProtocol?
    
    // MARK: Private Properties

    func viewDidLoad() {
        interactor?.fetchData()
    }
}

// MARK: - HomeInteractorDelegate

extension HomePresenter: HomeInteractorDelegate {
    func didFailFetchHomeData(error: HomeError) {
        switch error {
        case .unknown:
            view?.showError(message: "We can't fetch the data. Try again later.")
        }
    }
    
    func didFetchHomeData(_ homeData: HomeData) {
        view?.showData(homeData: homeData)
    }
}
