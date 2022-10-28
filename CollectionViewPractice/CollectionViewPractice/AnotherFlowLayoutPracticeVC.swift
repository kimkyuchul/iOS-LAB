//
//  AnotherFlowLayoutPracticeVC.swift
//  CollectionViewPractice
//
//  Created by qualson1 on 2022/10/29.
//

import UIKit

class AnotherFlowLayoutPracticeVC: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .systemOrange
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemOrange
        
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate(
            [
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            ]
        )
        setUpcollectionView()
    }
    
    func setUpcollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(AnotherFlowLayoutPracticeCell.classForCoder(), forCellWithReuseIdentifier: AnotherFlowLayoutPracticeCell.id)
    }
}

extension AnotherFlowLayoutPracticeVC: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AnotherFlowLayoutPracticeCell.id, for: indexPath) as? AnotherFlowLayoutPracticeCell else { fatalError() }
//        cell.configuration()
        return cell
    }
}

extension AnotherFlowLayoutPracticeVC: UICollectionViewDelegateFlowLayout {
    
    // https://baechukim.tistory.com/9 <- 이해가 안댐..
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        let itemsPerRow: CGFloat = 20
//        let width: CGFloat = (collectionView.bounds.width - itemsPerRow) / 2
//        let height: CGFloat = width * 1.4
//
//        return CGSize(width: width, height: height)
        
//        let width = UIScreen.main.bounds.width
//        let cellWidth = width * (240/375)
//        let cellHeight = cellWidth * (400/240)
//        return CGSize(width: cellWidth, height: cellHeight)
        
        let interval: CGFloat = 10
        let count = floor(UIScreen.main.bounds.width / 100)
        let size = floor((UIScreen.main.bounds.width - interval * 4) / count)
        return CGSize(width: size, height: size)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
}
