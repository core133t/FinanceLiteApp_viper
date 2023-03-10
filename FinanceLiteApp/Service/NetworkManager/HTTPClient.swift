//
//  HTTPClient.swift
//  FinanceLiteApp
//
//  Created by Dmitry Loginov on 22.12.2022.
//

import Foundation

protocol FinanceServiceProtocol {
    func load<T: Decodable>(endpoint: FinanceEndpoint, completion: @escaping (Result<T, Error>) -> Void)
    func cancel()
}

class FinanceService: FinanceServiceProtocol {
    private var session: URLSession
    private var dataTask: URLSessionDataTask?

    init(session: URLSession = .shared) {
        self.session = session
    }

    func load<T: Decodable>(endpoint: FinanceEndpoint, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: "https://raw.githubusercontent.com/core133t/FinanceLite-API/main/api/\(endpoint.rawValue).json") else {
            DispatchQueue.main.async {
                completion(.failure(FinanceServiceError.invalidURL))
            }
            return
        }
        let request = URLRequest(url: url)

        dataTask = session.dataTask(with: request, completionHandler: { data, response, error in
            guard let data = data else {
                DispatchQueue.main.async {
                    completion(.failure(FinanceServiceError.invalidData))
                }
                return
            }
            guard let decodedData = try? JSONDecoder().decode(T.self, from: data) else {
                DispatchQueue.main.async {
                    completion(.failure(FinanceServiceError.decode))
                }
                return
            }
            DispatchQueue.main.async {
                completion(.success(decodedData))
            }
        })

        dataTask?.resume()
    }

    func cancel() {
        self.dataTask?.cancel()
    }

}
