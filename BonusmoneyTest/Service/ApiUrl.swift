//
//  ApiUrl.swift
//  BonusmoneyTest
//
//  Created by Алексей Попроцкий on 11.05.2023.
//

import Foundation

class ApiUrl {
    static func url() -> URL? {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "dev.bonusmoney.pro"
        components.path = "/mobileapp/getAllCompanies"
//        components.path = "/mobileapp/getAllCompaniesIdeal"
//        components.path = "/mobileapp/getAllCompaniesError"
//        components.path = "/mobileapp/getAllCompaniesLong"
        return components.url
    }
    
    
    static func prepareHeader() -> [String: String] {
        var headers: [String: String] = [:]
        headers["TOKEN"] = "123"
        return headers
    }
    
    
    static func prepareBody(_ offset: Int) -> Data {
        var body: [String: Int] = [:]
        body["offset"] = offset
        var httpBody = Data()
        do {
            httpBody = try JSONSerialization.data(withJSONObject: body, options: .prettyPrinted)
        } catch let error {
            print(error.localizedDescription)
        }
        return httpBody
    }
}
