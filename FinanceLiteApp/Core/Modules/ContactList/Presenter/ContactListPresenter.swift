//
//  ContactListPresenter.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol ContactListPresenterDelegate: AnyObject {
    func showData(_ contactList: [ContactEntityNew])
}

final class ContactListPresenter: ContactListPresenterProtocol {
    
    weak var view: ContactListPresenterDelegate?
    var interactor: ContactListInteractorProtocol
    var router: ContactListRouterProtocol
    
    init(
        interactor: ContactListInteractorProtocol,
        router: ContactListRouterProtocol
    ) {
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad() {
        interactor.fetchData()
    }
}

extension ContactListPresenter: ContactListInteractorDelegate {
    func didFetchData(contactList: [ContactEntityNew]) {
        view?.showData(contactList)
    }
}
