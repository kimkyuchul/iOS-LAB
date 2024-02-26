//
//  ViewController.swift
//  GCD
//
//  Created by qualson1 on 2022/10/19.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 콜백 지옥 형식
        self.getData { data in
            self.decode(data: data) { contents in
                print(contents) // "<!doctype html>~~~~
            }
        }
        
        // async / await 호출
        // Task는 비동기로 수행할 작업을 클로저를 통해 전달하여 asynchronous context를 생성
        // async 함수는 다른 async 함수 내부 혹은 Task 구조체 이니셜라이저로 전달되는 클로저 내부와 같은 asynchronous context에서만 호출 가능
          Task {
              await self.process() // <!doctype html>~~~~
           }
    }

    @IBAction func btnTap(_ sender: Any) {
        for i in 1...100 {
               print(i, terminator: " ")   // 1번째
        }
           
        DispatchQueue.main.sync {  // 2번째
            for i in 101...200 {
                print(i)
            }
        }
        print("\n kyuchul kyuchul") // 3번째
    }
    
    // 기존의 콜백 지옥
    func getData(completion: (Data) -> Void) {
        let url = URL(string: "https://zeddios.tistory.com")!
        let data = try! Data(contentsOf: url)
        completion(data)
    }

    func decode(data: Data, completion: (String) -> Void) {
        let contents = String(data: data, encoding: .utf8)!
        completion(contents)
    }
    
    // completion을 return으로 바꿈
    // 메소드에 async 키워드 추가
    // async -> 함수를 비동기 함수로 만들겠다.
    // throws를 같이 쓸 수 있다. async throws
    func getData() async -> Data {
        let url = URL(string: "https://zeddios.tistory.com")!
        let data = try! Data(contentsOf: url)
        return data
    }

    func decode(data: Data) async -> String {
        let contents = String(data: data, encoding: .utf8)!
        return contents
    }
    
    //  사용하는 쪽에서 await와 함께 호출해준다.
    // 동기 함수 호출시 potential suspension point(잠재적인 일시 중단 지점) 지정
    // getData(), decode()를 호출하는 동안 작업이 일시 중단 되어야 함.
    // data 진짜 다 가져올 때 까지 작업을 더 진행 시키면 안되니까
    func process() async {
       let data = await self.getData()
       let contents = await self.decode(data: data)
       print(contents)
    }
}


