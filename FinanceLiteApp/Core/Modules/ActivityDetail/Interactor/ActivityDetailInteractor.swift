//
//  ActivityDetailInteractor.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol ActivityDetailsInteractorDelegate: AnyObject {
    func didFetchData(activity: ActivityEntity)
    func didReportProblem()
}

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    weak var presenter: ActivityDetailsInteractorDelegate?
    private var activity: ActivityEntity
    
    init(activity: ActivityEntity) {
        self.activity = activity
    }
    
    func fetchData() {
        presenter?.didFetchData(activity: activity)
    }
    
    func reportProblem() {
        presenter?.didReportProblem()
    }
}
