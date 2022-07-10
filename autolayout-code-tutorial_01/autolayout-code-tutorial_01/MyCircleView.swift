//
//  MyCircleView.swift
//  autolayout-code-tutorial_01
//
//  Created by qualson1 on 2022/07/10.
//

import Foundation
import UIKit

class myClircleView: UIView {
    
    
    override func layoutSubviews() {
        //오버라이드 메소드를 쓸 때 super를 꼭 해줘야 한다.
        super.layoutSubviews()
        print("myClircleView - layoutSubviews() 호츌")
        self.layer.cornerRadius = self.frame.height / 2
    }
    
}


