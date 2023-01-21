//
//  ActivityDetailPresenter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol ActivityDetailsPresenterDelegate: AnyObject {
    func didReportProblem()
    func showData(activity: ActivityEntity)
}

final class ActivityDetailsPresenter: ActivityDetailsPresenterProtocol {
    
    weak var view: ActivityDetailsPresenterDelegate?
    var interactor: ActivityDetailsInteractorProtocol
    var router: ActivityDetailsRouterProtocol
    
    init(interactor: ActivityDetailsInteractorProtocol, router: ActivityDetailsRouterProtocol) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.fetchData()
    }
    
    func reportProblem() {
        interactor.reportProblem()
    }
}

extension ActivityDetailsPresenter: ActivityDetailsInteractorDelegate {
    
    func didReportProblem() {
        view?.didReportProblem()
    }
    
    func didFetchData(activity: ActivityEntity) {
        view?.showData(activity: activity)
    }
}

