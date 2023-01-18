//
//  ContactListInteractor.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol ContactListInteractorDelegate: AnyObject {
    func didFetchData(contactList: [ContactEntityNew])
}

final class ContactListInteractor: ContactListInteractorProtocol {
    weak var presenter: ContactListInteractorDelegate?
    private let service: FinanceServiceProtocol
    private let coreDataManager = CoreDataManager.shared
    var data = [ContactEntityNew]()

    init(service: FinanceServiceProtocol) {
        self.service = service
        print("Enter To Contact Init")
        fetchDataFromURL()
    }

    func fetchData() {
        print("Enter to fetchData")
        do {
            let contactList = coreDataManager.getContactList()
            switch contactList {
            case .success(let list):
                self.data = list
            default: break
            }
        }
        
        print("self.data.count = \(self.data.count)")
        self.presenter?.didFetchData(contactList: self.data)
        print("Func:Fetchdata send to presenter (self.data)")
    }
    
    func fetchDataFromURL() {
        service.load(endpoint: .contactList) { [weak self] (result: Result<[ContactEntity], Error>) in
            guard let self = self else { return }
            switch result {
            case .success(let list):
                print("delete entity from CoreData")
                self.coreDataManager.deleteFromeCoreData()
                print("add new entity in CoreData")
                
                for contact in list {
                    let newContact = ContactEntityNew(context: self.coreDataManager.managedObjectContext)
                    newContact.name = contact.name
                    newContact.phone = contact.phone
                    self.coreDataManager.saveContext()
                }
                //self.presenter?.didFetchData(contactList: self.data)
            default: break
            }
        }
        print("In fetchDataFromURL")
    }

}

