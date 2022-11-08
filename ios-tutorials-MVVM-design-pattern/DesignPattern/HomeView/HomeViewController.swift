//
//  HomeViewController.swift
//  DesignPattern
//
//  Created by Emmanuel Okwara on 11/12/2021.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var welcomeLbl: UILabel!
    
    private let ViewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //로그인한 사용자를 알았으므로, 변경 사항을 알고 싶다면 바인더
        //로그인 정보를 가져오기 전에 바인더를 설정
        setUPBinders()
        ViewModel.getLoggendUser()
    }
    
    private func setUPBinders() {
        //업데이트된 값을 전달
        ViewModel.welcomeMessage.bind { [weak self] message in
            self?.welcomeLbl.text = message
        }
    }
 

}
