//
//  ActivityDetailInteractor.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol ActivityDetailsInteractorDelegate: AnyObject {
    func didFetchData()
    func didReportProblem()
}

final class ActivityDetailsInteractor: ActivityDetailsInteractorProtocol {
    
    weak var presenter: ActivityDetailsInteractorDelegate?
    
    func fetchData() {
        presenter?.didFetchData()
    }
    
    func reportProblem() {
        presenter?.didReportProblem()
    }
}
