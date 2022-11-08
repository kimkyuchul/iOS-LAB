//
//  LoginViewModel.swift
//  DesignPattern
//
//  Created by kimkyuchul on 2022/11/08.
//

import Foundation

// 로그인할 방법을 구현
final class LoginViewModel {
    
    //관찰 가능한 객체
    var error : ObservableObject<String?> = ObservableObject(nil)
    
    //로그인이 성공했을 때 로그인 메시지와 성공 여부를 알려주고 실패했을 땐 오류 메시지를 노출시켜야 하는데 MVC와 달리 View 권한이 없으므로 직접 업데이트 할 수 없음 => ViewModel이 완전히 독립적이라는 것을 기억
    func login(email: String, password: String) {
        NetworkService.shared.login(email: email, password: password) { [weak self] success in
            //로그인에 성공했다면 에러 메시지가 nil, 실패면 "Login error" => 간단하게 네트워크 요청을 뷰모델에서 함
            self?.error.value = success ? nil : "Login error"
            
        }
    }
}
