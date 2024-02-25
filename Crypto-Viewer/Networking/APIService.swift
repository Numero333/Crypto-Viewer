//
//  APIService.swift
//  Crypto-Viewer
//
//  Created by François-Xavier on 12/02/2024.
//

import Foundation

final class APIService<T: Codable> {
    
    let urlSession: URLSession
    
    init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    func performRequest(apiRequest: APIRequest, retries: Int = 3) async throws -> T {
        
        guard let url = URL(string: apiRequest.url.value) else { throw APIError.invalidUrl }
        
        var request = URLRequest(url: url)
        
        request.httpMethod = apiRequest.method.rawValue
        apiRequest.headers?.forEach { request.addValue($0.value, forHTTPHeaderField: $0.key) }
        
        do {
            let (data, response) =  try await urlSession.data(for: request)
            
            guard let httpResponse = response as? HTTPURLResponse else {
                throw APIError.unknownError
            }
            
            guard (200...299).contains(httpResponse.statusCode) else {
                throw APIError.invalidResponse(httpResponse.statusCode)
            }
            
            do {
                
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                return decodedData
                
            } catch {
                throw APIError.parsingError
            }
        } catch {
            
            if retries > 0 {
                
                try await Task.sleep(nanoseconds: 1000000000)
                
                return try await performRequest(apiRequest: apiRequest, retries: retries - 1)
                
            } else {
                throw APIError.unknownError
            }
        }
    }
}
