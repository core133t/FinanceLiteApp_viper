//
//  DoubleExtension.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

extension Double {
    func toBRLCurrency(identifier: String = "pt_BR") -> String? {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: identifier)
        formatter.numberStyle = .currency
        return formatter.string(for: self)
    }
}
