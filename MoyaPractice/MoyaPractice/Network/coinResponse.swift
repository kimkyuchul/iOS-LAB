//
//  coinResponse.swift
//  MoyaPractice
//
//  Created by 김규철 on 2022/11/22.
//

import Foundation

struct coinResponse: Codable {
    let status: String
    let data: ResponseData
    
    struct ResponseData: Codable {
        
        let opening_price: String
        let closing_price: String
        let min_price: String
        let max_price: String
        let acc_trade_value: String
        let prev_closing_price: String
        let units_traded_24H: String
        let acc_trade_value_24H: String
        let fluctate_24H: String
        let fluctate_rate_24H: String
        let date: String
    }
}

