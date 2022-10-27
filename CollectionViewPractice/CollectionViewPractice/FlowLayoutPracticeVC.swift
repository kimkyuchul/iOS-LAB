//
//  FlowLayoutPracticeVC.swift
//  CollectionViewPractice
//
//  Created by qualson1 on 2022/10/28.
//

import UIKit

class FlowLayoutPracticeVC: UIViewController {
    
    private let reLoadButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("RELOAD", for: .normal)
        button.backgroundColor = .systemCyan
        button.translatesAutoresizingMaskIntoConstraints = false //translatesAutoresizingMaskIntoConstraints라는 옵션을 false로 설정해 AutoresizingMask를 사용한 Constraints 변환을 막는 것
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .systemOrange
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemPink
        view.addSubview(reLoadButton)
        view.addSubview(collectionView)
        
    }
    
    func setUpcollectionView() {
           collectionView.delegate = self
           collectionView.dataSource = self
           
           //collectionView.register(ListTableViewCell.classForCoder(), forCellReuseIdentifier: "ListTableViewCell")
           }
    
    @objc func buttonTap() {
        print("CollectionView Reload")
    }
}

extension FlowLayoutPracticeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

extension FlowLayoutPracticeVC: UICollectionViewDelegateFlowLayout {
    
}
