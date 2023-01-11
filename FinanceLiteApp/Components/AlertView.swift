//
//  AlertView.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 11.01.2023.
//

import UIKit

final class AlertView {
    static func showAlert(title: String, message: String) -> UIAlertController {
        let alertView: UIAlertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action: UIAlertAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        alertView.addAction(action)
        return alertView
    }
}
