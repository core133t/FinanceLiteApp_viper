//
//  UserEntity.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import Foundation

struct UserEntity: Decodable {
    let name: String
    let phone: String
    let email: String
    let address: String
    let account: AccountEntity?
}

