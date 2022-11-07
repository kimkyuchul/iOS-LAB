//
//  ObservableObject.swift
//  DesignPattern
//
//  Created by kimkyuchul on 2022/11/08.
//

import Foundation

//특정 속성에 변경이 있을 때마다 알림을 보내는데 사용하는 ObservableObject
//이 클래스는 다른 유형을 가지거나 지원하기 때문에 제네릭으로 선언 (단일 유형이 아닌 여러 유형을 지원 (bool, String 등)
final class ObservableObject<T> {
    var value : T?
    
    //이 리스너 유형은 bind의 listener 유형
    //처음에는 nil이기 때문에 옵셔널
    //리스너를 단일 객체가 아닌 배열로 만들 수 있음 -> ex: 한사람만이 해당 채널을 구독할 수 있는 것이 아닌 여러 사람이 해당 채널을 구독할 수 있기 때문에 배열로 만들 수 있음 ( [((T?) -> Void)]?
    private var listener: ((T?) -> Void)?
    
    init(_ value: T?) {
        self.value = value
    }
    
    //특정 변경사항을 뷰에 알리는 메서드 리스너 매개변수가 뷰라고 생각하면 될 듯??..
    func bind(_ listener: @escaping(T?) -> Void) {
        //사용자가 이 특정 가능한 객체에 바인딩 하는 순간 알림을 트리거하거나 즉시 알림을 보낼 수 있음 (ex: cnn 뉴스를 구독 -> 뉴스를 기다리지 않고 즉시 확인이 가능 즉, 변경을 기다리지 않음)
        //청취자에게 말하고 나서 값을 전달하는 것?
        listener(value)
        self.listener = listener
    }
}
