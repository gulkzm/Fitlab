//
//  NetworkHelper.swift
//  Fitlab
//
//  Created by Gul Kzm on 18.04.25.
//

import Foundation
import Alamofire

enum EncodingType {
    case url
    case json
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    let baseURL = "https://fit-lab-cae25759b1fd.herokuapp.com/api/v1"

    func request<T: Decodable>(
        _ endpoint: String,
        method: HTTPMethod,
        responseType: T.Type,
        completion: @escaping (Result<T, Error>) -> Void
    ) {
        
       
        let url = baseURL + "/" + endpoint
        
        var headers: HTTPHeaders = [
            "Content-Type": "application/json"
        ]

        if let token = KeychainManager.shared.getToken() {
            headers.add(name: "Authorization", value: "Bearer \(token)")
        }

        AF.request(url, method: method, headers: headers)
            .validate()
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let value):
                    completion(.success(value))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}


