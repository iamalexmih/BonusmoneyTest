//
//  Network.swift
//  MoneyTest
//
//  Created by Алексей Попроцкий on 08.05.2023.
//

import Foundation


final class NetworkService {
    
    // Построение запроса по данным url
    func request(offset: Int, completion: @escaping (Data?, Error?) -> Void) {
//        let parameters = self.prepareParameters(searchText: searchText)
        let url = self.url()
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = prepareHeader()
        request.httpBody = prepareBody(offset)
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    
    private func createDataTask(from request: URLRequest,
                                completion: @escaping(Data?, Error?) -> Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { data, response, error in
            guard let response = response as? HTTPURLResponse else { return }
            let statusCode = response.statusCode
            print("statusCode ", statusCode)
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
    
    
    private func url() -> URL {
        var components = URLComponents()
        components.scheme = "http"
        components.host = "dev.bonusmoney.pro"
        components.path = "/mobileapp/getAllCompaniesIdeal"
        return components.url!
    }
    
    
    private func prepareHeader() -> [String: String] {
        var headers: [String: String] = [:]
        headers["TOKEN"] = "123"
        return headers
    }
    
    
    private func prepareBody(_ offset: Int) -> Data {
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

