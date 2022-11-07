//
//  LoginViewController.swift
//  DesignPattern
//
//  Created by Emmanuel Okwara on 11/12/2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        
    }
    
    //화면을 누를 때마다 호출되는 제스처 죽, 화면 어디를 클릭하면 키보드가 내려가게 만듬 https://zeddios.tistory.com/132
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
