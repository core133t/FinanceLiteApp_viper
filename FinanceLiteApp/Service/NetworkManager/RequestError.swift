//
//  RequestError.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

enum FinanceServiceError: Error {
    case decode, invalidData, invalidURL
}
