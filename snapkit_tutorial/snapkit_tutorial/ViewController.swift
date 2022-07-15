//
//  ViewController.swift
//  snapkit_tutorial
//
//  Created by qualson1 on 2022/07/14.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    lazy var greenBox = { () -> UIView in
           let view = UIView()
           view.backgroundColor = .green
           return view
       }()
       
       lazy var redBox = { () -> UIView in
           let view = UIView()
           view.backgroundColor = .red
           return view
       }()
       
       lazy var yellowBox = { () -> UIView in
           let view = UIView()
           view.backgroundColor = .yellow
           return view
       }()
       
       lazy var blueBox = { () -> UIView in
           let view = UIView()
           view.backgroundColor = .blue
           return view
       }() //중괄호를 미리 선언해서 실행하여 viewDidLoad 등에서 bluebox()를 안해도 바로 나오게 된다.

       override func viewDidLoad() {
           super.viewDidLoad()
           
           addSubView()
           //anchor()
           snapKit()
           
           
   }
       
       
       func addSubView() {
           
           self.view.addSubview(greenBox)
           self.view.addSubview(redBox)
           self.view.addSubview(yellowBox)
           self.view.addSubview(blueBox)
        
           yellowBox.addSubview(redBox)
           
           
       }
       
       func anchor() {
           greenBox.translatesAutoresizingMaskIntoConstraints = false
           redBox.translatesAutoresizingMaskIntoConstraints = false
           yellowBox.translatesAutoresizingMaskIntoConstraints = false
           blueBox.translatesAutoresizingMaskIntoConstraints = false
           
           NSLayoutConstraint.activate([
           //  yellowBox.widthAnchor.constraint(equalTo: self.view.widthAnchor, multiplier: 0.8),
           //  yellowBox.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 0.8),
           //  yellowBox.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
           //  yellowBox.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
               
               yellowBox.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20),
               yellowBox.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -20),
               yellowBox.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
               yellowBox.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
               
           
           ])
       }
       
       func snapKit() {
           
           
           
        
           yellowBox.snp.makeConstraints { (make) in
                   //edges = top,bottom,leading,trailing 전체
               make.edges.equalTo(self.view).inset(UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
               //make.edges.equalToSuperview().inset(UIEdgeInsets(top: 100, left: 50, bottom: 50, right: 50))
           }
           
           
           redBox.snp.makeConstraints{ (make) in
               make.width.height.equalTo(100)
               make.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
               make.centerX.equalToSuperview()
              
           
       }
           
           blueBox.snp.makeConstraints{ (make) in
               make.width.height.equalTo(100)
               make.top.equalTo(redBox.snp.bottom).offset(20)
               make.centerX.equalToSuperview()
       }
           
           greenBox.snp.makeConstraints{ (make) in
               make.width.height.equalTo(100)
               make.top.equalTo(redBox.snp.bottom).offset(20)
               make.centerX.equalToSuperview()
       }


   }
    
}
//opt + cmd + Enter = 프리뷰 창 열기
//opt + cmd + p = 프리뷰 시작
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable {
    // update
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
}
    @available(iOS 13.0, *)
    func makeUIViewController(context: Context) -> UIViewController {
        ViewController()
        }
}

struct ViewController_previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewControllerRepresentable()
                .ignoresSafeArea()
                .previewDisplayName("프리뷰")
                .previewDevice(PreviewDevice(rawValue: "iPhone 13 Pro Max"))
                
        }
    }
}

#endif

