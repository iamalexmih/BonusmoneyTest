//
//  Network.swift
//  MoneyTest
//
//  Created by Алексей Попроцкий on 08.05.2023.
//

import Foundation


protocol NetworkServiceProtocol: AnyObject {
    func request(offset: Int, completion: @escaping (Result<[Company], ApiError>) -> Void)
}

final class NetworkService: NetworkServiceProtocol {
    
    func request(offset: Int, completion: @escaping (Result<[Company], ApiError>) -> Void) {
        let url = ApiUrl.url()
        
        performRequest(with: url, offset: offset, type: [Company].self) { result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    completion(.failure(error))
                case .success(let data):
                    completion(.success(data))
                }
            }
        }
    }
    
    
    private func performRequest<T: Decodable>(with url: URL?,
                                              offset: Int,
                                              type: T.Type,
                                              completion: @escaping (Result<T, ApiError>) -> Void) {
        guard let url = url else {
            completion(.failure(.urlNotCreate))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.allHTTPHeaderFields = ApiUrl.prepareHeader()
        request.httpBody = ApiUrl.prepareBody(offset)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in

            guard error == nil else {
                completion(.failure(.internetConnectionLost))
                return
            }
            if let response = response as? HTTPURLResponse,
                      !(200...299).contains(response.statusCode) {
                
                completion(.failure(.badResponse(response: response, statusCode: response.statusCode)))
            }
            
            guard let data = data else {
                completion(.failure(.dataError))
                return
            }
            
            do {
                if let decodedData = try? JSONDecoder().decode(type.self, from: data) {
                    completion(.success(decodedData))
                } else {
                    completion(.failure(.decodeError))
                }
            }
        }
        task.resume()
    } 
}

