//
//  ViewController.swift
//  autolayout-code-tutorial_01
//
//  Created by qualson1 on 2022/07/08.
//

import UIKit

class ViewController: UIViewController {
    
    
    //클로져로 뷰를 설정
    
    var mySecondView : UIView = {
        let view = UIView()
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 16
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var myThirdView : myClircleView = {
        let circleview = myClircleView()
        circleview.backgroundColor = .systemMint
        circleview.translatesAutoresizingMaskIntoConstraints = false
        return circleview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myFirstView = UIView()
        myFirstView.translatesAutoresizingMaskIntoConstraints = false
        myFirstView.backgroundColor = .systemPink
        self.view.addSubview(myFirstView)
        
        // X 축, Y 축 위치
        myFirstView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        myFirstView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 100).isActive = true
        
        // 뷰의 가로 세로 크기 제공
        myFirstView.widthAnchor.constraint(equalToConstant: 300).isActive = true
        myFirstView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        self.view.addSubview(mySecondView)
        NSLayoutConstraint.activate([
            mySecondView.widthAnchor.constraint(equalToConstant: 100),
            mySecondView.heightAnchor.constraint(equalToConstant: 100),
            mySecondView.leadingAnchor.constraint(equalTo: myFirstView.leadingAnchor, constant: 10),
            mySecondView.topAnchor.constraint(equalTo: myFirstView.bottomAnchor, constant: 10)
        ])
        
        self.view.addSubview(myThirdView)
        NSLayoutConstraint.activate([
            myThirdView.widthAnchor.constraint(equalTo: mySecondView.widthAnchor, multiplier: 1.5),
            myThirdView.heightAnchor.constraint(equalTo: mySecondView.heightAnchor, multiplier: 1.5),
            myThirdView.topAnchor.constraint(equalTo: mySecondView.bottomAnchor, constant: 50),
            myThirdView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    
    }


}


//opt + cmd + p = 프리뷰 시작
#if DEBUG
import SwiftUI
struct ViewControllerRepresentable: UIViewControllerRepresentable
{
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
                .previewInterfaceOrientation(.portrait)
            ViewControllerRepresentable()
                .previewInterfaceOrientation(.portrait)
        }
    }
}

#endif

