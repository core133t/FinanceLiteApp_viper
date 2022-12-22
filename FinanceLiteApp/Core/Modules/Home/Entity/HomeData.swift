//
//  HomeData.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

struct HomeData: Codable {
    let balance: Double
    let savings: Double
    let spending: Double
    let activity: [Activity]
}
