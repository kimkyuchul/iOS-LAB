//
//  BithumbAPI.swift
//  MoyaPractice
//
//  Created by 김규철 on 2022/11/22.
//

import Foundation
import Moya

enum BithumbAPI {
    case getData(orderCurrency: String, paymentCurrency: String)
}

extension BithumbAPI: BaseTargetType {
    var baseURL: URL {
        return URL(string: URLConst.base)!
    }
        
    // 요청 경로
    // 주문 통화와 결제 통화
    var path: String {
        switch self {
        case .getData(let orderCurrency, let paymentCurrency):
            return URLConst.ticker + "?order_currency=\(orderCurrency)&payment_currency=\(paymentCurrency)"
        }
    }
    
    // http 요청 메소드
    var method: Moya.Method {
        switch self {
        case .getData:
            return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .getData:
            return .requestPlain // A request with no additional data
        }
    }
    
    // http 헤더
    var headers: [String : String]? {
        return [
            "content-type": "application/json"
        ]
    }
}
