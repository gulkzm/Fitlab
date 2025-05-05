//
//  AuthManager.swift
//  Fitlab
//
//  Created by Gul Kzm on 21.04.25.
//

import Alamofire


class AuthManager {
    static let shared = AuthManager()

    func register(fullname: String, email: String, password: String, gender: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let params: Parameters = [
            "fullname": fullname,
            "email": email,
            "password": password,
            "gender": gender
        ]
        
        AF.request("\(NetworkHelper.shared.baseURL)/auth/register", method: .post, parameters: params, encoding: JSONEncoding.default)
            .validate()
            .response { response in
                switch response.result {
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }

    func login(email: String, password: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let params: Parameters = [
            "email": email,
            "password": password
        ]

        AF.request("\(NetworkHelper.shared.baseURL)/auth/login", method: .post, parameters: params, encoding: JSONEncoding.default)
            .validate()
            .responseDecodable(of: TokenResponse.self) { response in
                switch response.result {
                case .success(let tokenResponse):
                    KeychainManager.shared.saveToken(tokenResponse.token)
                    print("Token: \(tokenResponse.token)")
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

struct TokenResponse: Decodable {
    let token: String
}
