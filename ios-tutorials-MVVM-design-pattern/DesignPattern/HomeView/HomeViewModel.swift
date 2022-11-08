//
//  HomeViewModel.swift
//  DesignPattern
//
//  Created by kimkyuchul on 2022/11/08.
//

import Foundation

// 한번 더 강조 뷰모델은 뷰와 직접적으로 연관된 속성 및 메서드를 포함하므로 필요하지 않는 것은 가져오지 않음
final class HomeViewModel {
    
    //관찰 가능한 객체로 생성
    var welcomeMessage: ObservableObject<String?> = ObservableObject(nil)
    
    func getLoggendUser() {
        //뷰는 모델과 직접 작동하지 않음. 모델을 인식하는 유일한 것은 뷰모델. 뷰모델은 기본적으로 뷰에 필요한 것을 노출
        //홈뷰의 환영메시지가 사용자의 성과 이름을 필요로 하기 때문에 self.welcomeMessage.value에 성과 이름을 넣어줌
        //뷰는 사용자 모델을 인식하지 못함, 하지만 필요한 뷰모델의 속성(성, 이름)들을 알고 있다.
        let user = NetworkService.shared.getLoggendInUser()
        self.welcomeMessage.value = "hello, \(user.fristname) \(user.lastname)"
    }
}
