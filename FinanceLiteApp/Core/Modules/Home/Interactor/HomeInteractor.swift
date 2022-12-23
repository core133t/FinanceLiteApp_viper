//
//  HomeInteractor.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol HomeInteractorDelegate: AnyObject {
    func didFetchData()
}

final class HomeInteractor: HomeInteractorProtocol {
    weak var presenter: HomeInteractorDelegate?
    
    func didFetchData() {
        presenter?.didFetchData()
    }
}


