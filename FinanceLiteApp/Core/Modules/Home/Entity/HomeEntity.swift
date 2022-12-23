//
//  HomeEntity.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import Foundation

struct HomeEntity: Decodable {
    let balance: Double
    let savings: Double
    let spending: Double
    let listActivity: [ActivityEntity]
    
    private enum CodingKeys: String, CodingKey {
        case balance, savings, spending
        case listActivity = "activity"
    }
}
