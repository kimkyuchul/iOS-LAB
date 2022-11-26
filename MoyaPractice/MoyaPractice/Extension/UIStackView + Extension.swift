//
//  UIStackView + Extension.swift
//  MoyaPractice
//
//  Created by 김규철 on 2022/11/25.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views : [UIView]) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
