////
////  NetworkManager.swift
////  Fitlab
////
////  Created by Gul Kzm on 18.04.25.
////
//
//import Foundation
//import Alamofire
//
//class NetworkManager {
//    static let shared = NetworkManager()
//    private let baseURL = "https://fit-lab-cae25759b1fd.herokuapp.com/api/v1"
//    
//    private let session: Session
//    
//    init() {
//        let interceptor = TokenInterceptor()
//        session = Session(interceptor: interceptor)
//    }
//    
//    //    func request(_ path: String,
//    //                 method: HTTPMethod = .get,
//    //                 parameters: Parameters? = nil,
//    //                 encoding: ParameterEncoding = URLEncoding.default,
//    //                 completion: @escaping((AnyObject, String?) -> Void)) {
//    //
//    //        let url = "\(baseURL)/\(path)"
//    //
//    //        session.request(url, method: method, parameters: parameters, encoding: encoding)
//    //            .validate()
//    //            .responseData { response in
//    //                completion(response.result as AnyObject, <#String?#>)
//    //            }
//    //    }
//    func request(_ path: String,
//                 method: HTTPMethod = .get,
//                 parameters: Parameters? = nil,
//                 encoding: ParameterEncoding = URLEncoding.default,
//                 completion: @escaping (Result<Data, AFError>) -> Void) {
//        
//        let url = "\(baseURL)/\(path)"
//        
//        session.request(url, method: method, parameters: parameters, encoding: encoding)
//            .validate()
//            .responseData { response in
//                completion(response.result)
//            }
//    }
//}
