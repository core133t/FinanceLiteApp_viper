//
//  HomeInteractor.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol HomeInteractorDelegate: AnyObject {
    func didFetchData(activityList: HomeEntity)
}

final class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomeInteractorDelegate?
    private let service: FinanceServiceProtocol
    
    init(service: FinanceServiceProtocol) {
        self.service = service
    }
    
    func didFetchData() {
        service.load(endpoint: .home) { [weak self] (result: Result<HomeEntity, Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let list):
                self.presenter?.didFetchData(activityList: list)
            default: break
            }
        }
    }
}


