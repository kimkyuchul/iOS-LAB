//
//  CoinCollectionViewCell.swift
//  MoyaPractice
//
//  Created by 김규철 on 2022/11/22.
//

import UIKit
import SnapKit

class CoinCollectionViewCell: UICollectionViewCell {
    
    static let id = "CoinCollectionViewCell"
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        return label
    }()
    
    let callBackLabel : UILabel = {
        let label = UILabel()
        label.sizeToFit()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.black
        label.text = "00"
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewHierarchies()
        setConstraints()
        setUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewHierarchies() {
//        [titleLabel, callBackLabel].forEach {
//            addSubview($0)
//        }
        contentView.addSubview(titleLabel)
        contentView.addSubview(callBackLabel)
        
    }
    func setConstraints() {
            titleLabel.snp.makeConstraints { make in
                make.centerX.equalToSuperview()
                make.centerY.equalToSuperview()
            }
            callBackLabel.snp.makeConstraints { make in
                make.top.equalTo(titleLabel.snp.bottom).offset(10)
                make.centerX.equalToSuperview()
            }
            
        }
    
    func setUI() {
        contentView.layer.backgroundColor = UIColor.orange.cgColor
        contentView.layer.borderWidth = 1
        contentView.layer.borderColor = UIColor.systemMint.cgColor
        
        contentView.layer.cornerRadius = 10
    }
}
