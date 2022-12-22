//
//  Endpoint.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol Endpoint {
    var baseURL: String { get }
    var path: String { get }
    var method: RequestMethod { get }
    var header: [String: String]? { get }
    var body: [String: String]? { get }
}

extension Endpoint {
    var baseURL: String {
        return Constants.baseURL
    }
    
    var header: [String: String]? {
        return nil
    }

    var body: [String: String]? {
        return nil
    }
}
