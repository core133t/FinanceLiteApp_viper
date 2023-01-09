//
//  ContactListInteractor.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol ContactListInteractorDelegate: AnyObject {
    func didFetchData(contactList: [ContactEntity])
}

final class ContactListInteractor: ContactListInteractorProtocol {
    weak var presenter: ContactListInteractorDelegate?
    private let service: FinanceServiceProtocol

    init(service: FinanceServiceProtocol) {
        self.service = service
    }

    func fetchData() {
        service.load(endpoint: .contactList) { [weak self] (result: Result<[ContactEntity], Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let list):
                self.presenter?.didFetchData(contactList: list)
            default: break
            }
        }
    }
}

