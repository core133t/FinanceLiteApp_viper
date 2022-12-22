//
//  FinanceService.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol FinanceServiceProtocol {
    func fetchActivityDetail() async -> Result<Activity, RequestError>
}

struct FinanceService: HTTPClient, FinanceServiceProtocol {
    
    func fetchActivityDetail() async -> Result<Activity, RequestError> {
        return await sendRequest(endpoint: FinanceEndpoint.activityDetail, responseModel: Activity.self)
    }
}
