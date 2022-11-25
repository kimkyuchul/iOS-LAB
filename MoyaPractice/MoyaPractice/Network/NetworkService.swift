//
//  NetworkService.swift
//  MoyaPractice
//
//  Created by 김규철 on 2022/11/25.
//

import Foundation

final class NetworkService {
    static let shared = NetworkService()
    
    private init() { }
    
    let bithumb = BithumbService()
}
