//
//  HomeService.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

protocol HomeServiceProtocol {
    func fetchHomeInformation() async -> Result<HomeData, RequestError>
}

// MARK: - HomeService

struct HomeService: HTTPClient, HomeServiceProtocol {
    
    // MARK: Public Methods
    
    func fetchHomeInformation() async -> Result<HomeData, RequestError> {
        return await sendRequest(endpoint: HomeEndpoint.homeInformation, responseModel: HomeData.self)
    }
}

