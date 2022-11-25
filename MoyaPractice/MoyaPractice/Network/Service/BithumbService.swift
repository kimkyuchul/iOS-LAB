//
//  BithumbService.swift
//  MoyaPractice
//
//  Created by 김규철 on 2022/11/23.
//

import Foundation
import Moya

final class BithumbService {
    
//    static let shared = BithumbService()
    
    private var bithumbProvider = MoyaProvider<BithumbAPI>()

    
     public func getBithumbs(orderCurrency: String, paymentCurrency: String, completion: @escaping (NetworkResult<Any>) -> Void) {
        
        bithumbProvider.request(.getData(orderCurrency: orderCurrency, paymentCurrency: paymentCurrency)) { result in
            switch result {
            case.success(let response):
                let statusCode = response.statusCode
                let data = response.data
                
                let networkResult = self.judgeStatus(by: statusCode, data)
                completion(networkResult)
                
            case.failure(let error):
                print(error)
            }
        }
    }
    
    private func judgeStatus(by statusCode: Int, _ data: Data) -> NetworkResult<Any> {
        switch statusCode {
        case 200:
            return isValidData(data: data)
        case 400..<500:
            return .pathErr
        case 500:
            return .serverErr
        default:
            return .networkFail
        }
    }
    
    
    private func isValidData(data: Data) -> NetworkResult<Any> {
        let decoder = JSONDecoder()
        
        guard let decodedData = try? decoder.decode(coinResponse.self, from: data) else {
            return .pathErr}
        
        return .success(decodedData.data)
        }
    }

