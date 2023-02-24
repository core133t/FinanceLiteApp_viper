//
//  AccountEntity.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import Foundation

struct AccountEntity: Decodable {
    let agency: String
    let account: String
    let bank: String
}
