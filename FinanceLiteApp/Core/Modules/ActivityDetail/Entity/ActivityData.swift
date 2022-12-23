//
//  ActivityData.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 19.12.2022.
//

import Foundation

struct ActivityEntity: Decodable {
    let name: String
    let price: Double
    let time: String
}

