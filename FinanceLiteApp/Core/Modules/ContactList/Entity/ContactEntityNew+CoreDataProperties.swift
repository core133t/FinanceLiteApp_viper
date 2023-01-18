//
//  ContactEntityNew+CoreDataProperties.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 18.01.2023.
//
//

import Foundation
import CoreData


extension ContactEntityNew {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ContactEntityNew> {
        return NSFetchRequest<ContactEntityNew>(entityName: "ContactEntityNew")
    }

    @NSManaged public var name: String?
    @NSManaged public var phone: String?

}
