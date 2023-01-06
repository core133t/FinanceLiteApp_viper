//
//  NetworkServiceMockTest.swift
//  FinanceLiteAppTests
//
//  Created by Dmitry Loginov on 23.12.2022.
//

import XCTest
@testable import FinanceLiteApp

final class FinanceServiceMock: FinanceService {
    var loadCount = false
    var cancelCount = false
    /*
    override func load<T>(endpoint: FinanceEndpoint, completion: @escaping (Result<T, Error>) -> Void) where T : Decodable {
        //loadCount+=1
    }
    
    override func cancel() {
        cancelCount+=1
    }
     */
}


class FinanceServiceTests: XCTestCase {
    /*
     case home = "home_endpoint"
     case contactList = "contact_list_endpoint"
     case userProfile = "user_profile_endpoint"
     case transfer = "transfer_successful_endpoint"
     */
    let mock = FinanceServiceMock()
    var m = FinanceService()
    func test_Load() {
        print("111111111111")
        /*
         m.load(endpoint: .userProfile) { (response: Result<UserEntity, Error>) in
         switch response {
         case .success(_): //self.presenter?.didFetchData(userProfile)
         print("22222222222")
         self.m.loadCount = true
         default: break
         }
         }
         */
        m.load(endpoint: .contactList) { [weak self] (result: Result<[ContactEntity], Error>) in
            guard let self = self else { return }
            switch result {
            case .success(_):
                self.mock.loadCount = true
            default: break
            }
        }
       // XCTAssert(self.mock.loadCount == true)
    }
}

