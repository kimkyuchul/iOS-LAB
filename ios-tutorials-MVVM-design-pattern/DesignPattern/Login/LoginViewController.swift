//
//  LoginViewController.swift
//  DesignPattern
//
//  Created by Emmanuel Okwara on 11/12/2021.
//

//VC에서 로그인 기능을 구현하기 전에 하는 것 => 비즈니스 로직과 네트워크 뒷부분에 있는 로직?을 구현


import UIKit
class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    /*viewmodel의 인스턴스를 만들것 => view가 viewmodel과 직접적으로 접촉하고 있다는 것을 의미하는 인스턴스
    기본적으로 viewmodel에 있는 다른 속성과 연결하는 것이 좋음 */
    private let viewmodel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupBinders()
    }
    
    // viewmodel이 나에게 직접 알려주지 않는다는 것을 명심 => 뷰를 직접 업데이트 하지 않음
    private func setupBinders() {
        //바인드할 때 기본적으로 특정 항목(error)을 구독 하고 있다. viewmodel에 있는 error 이므로 "[weark self] in error"가 아닌 "[weark self] error in"
        //viewmodel에 지정하는 유형이 항상 관찰 객체와 동일했으면 함 => "let error : String??"로 노출 => ObservableObject의 제네릭 객체들의 옵셔널을 제거 => "let error : String?"
        viewmodel.error.bind { [weak self] error in
            //오류가 있거나 오류값이 변경될 때 마다 알림을 받음
            if let error = error {
                print(error)
            } else {
                self?.goToHomePage()
            }
        }
    }
    
    private func goToHomePage() {
        let controller = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        present(controller, animated: true, completion: nil)
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        guard let email = emailField.text,
              let password = passwordField.text else { print("email & pwd"); return }
        viewmodel.login(email: email, password: password)
        
    }
    
    //화면을 누를 때마다 호출되는 제스처 죽, 화면 어디를 클릭하면 키보드가 내려가게 만듬 https://zeddios.tistory.com/132
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
