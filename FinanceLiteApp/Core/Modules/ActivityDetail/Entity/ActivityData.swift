//
//  ActivityData.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 19.12.2022.
//

import Foundation

struct Activity: Codable {
    
    enum CategoryType: String, Codable {
        case shopping = "Shopping"
    }
    
    let name: String
    let category: CategoryType?
    let price: Double
    let time: String
}

