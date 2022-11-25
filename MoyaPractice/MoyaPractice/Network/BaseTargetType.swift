//
//  BaseTargetType.swift
//  MoyaPractice
//
//  Created by 김규철 on 2022/11/24.
//

import Foundation
import Moya

protocol BaseTargetType:TargetType { }

extension BaseTargetType {
    
    var baseURL: URL {
        return URL(string: URLConst.base)!
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var headers: [String : String]? {
        return [
            "content-type": "application/json"
        ]
    }
    
//    토큰이 있다면 ?
//    var headers: [String : String]? {
//        if let token = UserDefaults.standard.value(forKey: UserDefaultskey.token) {
//            let headers = [
//                "Content-Type": "application/json",
//                "Authorization": "Bearer \(String(describing: token))"
//            ]
//            return headers
//        } else {
//            let headers = [
//                "content-type": "application/json"
//            ]
//            return headers
//        }
//    }
}



