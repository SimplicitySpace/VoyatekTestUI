//
//  APICALLS.swift
//  Cocktail
//
//  Created by Mac on 6/23/24.
//

import Foundation


class APIService {
    static let shared = APIService()
    private let baseURL = "https://assessment.vgtechdemo.com/api/foods"

    private init() {}

 
    private func request<T: Decodable>(url: String, method: String = "GET", body: Data? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        guard let url = URL(string: url) else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        if let body = body {
            request.httpBody = body
        }

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 500, userInfo: nil)))
                return
            }

            if let _ = String(data: data, encoding: .utf8) {
//                print("🔍 API Response: \(jsonString)")
            }

            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                DispatchQueue.main.async {
                    completion(.success(decodedData))
                }
            } catch {
               
                completion(.failure(error))
            }
        }.resume()

    }
    

    func fetchFoodItems(completion: @escaping (Result<[FoodItem], Error>) -> Void) {
        request(url: "\(baseURL)") { (result: Result<APIResponse, Error>) in
            switch result {
            case .success(let response):
                completion(.success(response.data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }

    

    func postFoodItem(jsonData: Data, completion: @escaping (Result<Void, Error>) -> Void) {
        var request = URLRequest(url: URL(string: baseURL)!)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = jsonData

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            completion(.success(())) 
        }.resume()
    }
}


