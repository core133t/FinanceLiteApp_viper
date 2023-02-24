//
//  DefineImageColor.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 25.02.2023.
//

import UIKit
final class ImageColor {
    static func defineImageColor(_ imageTag:String) -> UIColor {
        switch imageTag {
        case "bag":
            return .systemPurple
        case "car":
            return .systemBlue
        case "bank":
            return .systemPink
        case "food":
            return .systemGreen
        case "airline":
            return .systemTeal
        default:
            return .red
        }
    }
}
