//
//  CoinView.swift
//  MoyaPractice
//
//  Created by 김규철 on 2022/11/22.
//

import UIKit
import SnapKit

class CoinView: UIView {
    
    let collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionview.backgroundColor = .systemCyan
        return collectionview
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewHierarchies()
        setConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setViewHierarchies() {
        addSubview(collectionView)
    }
    
    func setConstraints() {
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
    
}
