//
//  NetworkManger.swift
//  SportSync
//
//  Created by Abdelrhman Mamdouh on 11/05/2024.
//
import Alamofire
import Foundation
class NetworkManager {
    static let shared = NetworkManager()
    
    enum APIError: Error {
        case invalidResponse
    }
    
    func requestData<T: Decodable>(endpoint: String, method: HTTPMethod = .get, parameters: [String: Any]? = nil, completion: @escaping (Result<T, Error>) -> Void) {
        let url = Constants.baseURL + endpoint
        
        var requestParams = parameters ?? [:]
        requestParams["APIkey"] = Constants.apiKey
        
        AF.request(url, method: method, parameters: requestParams)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let data):
                    completion(.success(data))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}
