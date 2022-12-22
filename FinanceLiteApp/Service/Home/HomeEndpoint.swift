//
//  HomeEndpoint.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

enum HomeEndpoint {
    case homeInformation
}

extension HomeEndpoint: Endpoint {
    var path: String {
        switch self {
        case .homeInformation:
            return "/devpass-tech/challenge-finance-app/main/api/home_endpoint.json"
        }
    }
    
    var method: RequestMethod {
        switch self {
        case .homeInformation:
            return .get
        }
    }
}
