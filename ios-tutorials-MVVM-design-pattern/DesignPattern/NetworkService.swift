//
//  NetworkService.swift
//  DesignPattern
//
//  Created by kimkyuchul on 2022/11/08.
//

import Foundation

final class NetworkService {
    //싱글톤 생성
    static let shared = NetworkService()
    
    //로그인한 사용자 객체
    private var user: User?
    
    private init() {}
    
    //로그인이 성공했는지 실패헀는지 알려주는 @escaping 컴플리션 클로저
    func login (email: String, password: String, completion: @escaping(Bool) -> Void  ) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            if email == "test@test.com" &&  password == "password" {
                self?.user = User(fristname: "kyuchul", lastname: "kim", email: "test@test.com", age: 25)
                completion(true)
            } else {
                self?.user = nil
                completion(false)
            }
        }
    }
    
    func getLoggendInUser() -> User {
        return user!
    }
}
