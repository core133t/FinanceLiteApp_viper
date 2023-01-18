//
//  Extension CoreDataManager.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 17.01.2023.
//

import Foundation
import CoreData

extension CoreDataManager {
    
    func getContactList() -> Result <[ContactEntityNew], Errors>{
        let fetchRequest: NSFetchRequest<ContactEntityNew> = ContactEntityNew.fetchRequest()
        
        do {
            let result = try managedObjectContext.fetch(fetchRequest)
            print("Got \(result.count) result")
            return .success(result)
        } catch {
            print("Fetch failed")
            return .failure(Errors.loadContactListError)
        }
    }
    
    func deleteFromeCoreData() {
        do {
            try managedObjectContext.execute(NSBatchDeleteRequest(fetchRequest: NSFetchRequest(entityName: "ContactEntityNew")))
            try managedObjectContext.save()
        } catch {
            
        }
    }

    
}
