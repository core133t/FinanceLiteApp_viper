//
//  FinanceEndpoint.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

enum FinanceEndpoint {
    case activityDetail
}

extension FinanceEndpoint: Endpoint {
    var path: String {
        switch self {
        case .activityDetail:
            return "/devpass-tech/challenge-finance-app/main/api/activity_details_endpoint.json"
        }
    }

    var method: RequestMethod {
        switch self {
        case .activityDetail:
            return .get
        }
    }
}
