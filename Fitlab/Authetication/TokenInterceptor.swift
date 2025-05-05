//
//  TokenInterceptor.swift
//  Fitlab
//
//  Created by Gul Kzm on 18.04.25.
//

import Foundation
import Alamofire

final class AuthInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var request = urlRequest
        if let token = KeychainManager.shared.getToken() {
            request.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        completion(.success(request))
    }
}

