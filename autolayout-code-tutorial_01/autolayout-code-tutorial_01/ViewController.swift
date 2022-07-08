//
//  ViewController.swift
//  autolayout-code-tutorial_01
//
//  Created by qualson1 on 2022/07/08.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myFirstView = UIView()
        myFirstView.translatesAutoresizingMaskIntoConstraints = false
        myFirstView.backgroundColor = .systemPink
        self.view.addSubview(myFirstView)
        
        // X 축, Y 축 위치
        myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200).isActive = true
        
        // 뷰의 가로 세로 크기 제공
        myFirstView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myFirstView.heightAnchor.constraint(equalToConstant: 300).isActive = true
    
    }


}

