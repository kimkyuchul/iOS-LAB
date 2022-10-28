//
//  FlowLayoutPracticeVC.swift
//  CollectionViewPractice
//
//  Created by qualson1 on 2022/10/28.
//

import UIKit

class FlowLayoutPracticeVC: UIViewController {
    
    private lazy var reLoadButton:UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("RELOAD", for: .normal)
        button.backgroundColor = .systemCyan
        button.translatesAutoresizingMaskIntoConstraints = false //translatesAutoresizingMaskIntoConstraints라는 옵션을 false로 설정해 AutoresizingMask를 사용한 Constraints 변환을 막는 것
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.backgroundColor = .systemOrange
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.systemPink
        
        view.addSubview(collectionView)
        view.addSubview(reLoadButton)
        
        NSLayoutConstraint.activate(
            [
                collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                collectionView.bottomAnchor.constraint(equalTo: reLoadButton.topAnchor, constant: -15),
                reLoadButton.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                reLoadButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 5),
                reLoadButton.widthAnchor.constraint(equalToConstant: 100),
                reLoadButton.heightAnchor.constraint(equalToConstant: 45),
            ]
        )
        setUpcollectionView()
        
    }
    
    func setUpcollectionView() {
           collectionView.delegate = self
           collectionView.dataSource = self
           
        collectionView.register(FlowLayoutPracticeCell.classForCoder(), forCellWithReuseIdentifier: FlowLayoutPracticeCell.id)
           }
    
    @objc func buttonTap() {
        print("CollectionView Reload")
        collectionView.collectionViewLayout.invalidateLayout()
        //collectionView.reloadData()
    }
}

extension FlowLayoutPracticeVC: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FlowLayoutPracticeCell.id, for: indexPath) as? FlowLayoutPracticeCell else { fatalError() }
        
        cell.backgroundColor = .link
        cell.configuration(title: String(indexPath.item))
        return cell
        
    }
}

extension FlowLayoutPracticeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 10 * Int.random(in: 5...10), height: 10 * Int.random(in: 5...10))
    }
    
    //셀들 간의 좌 우 간격을 조절
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    //셀들 간의 위 아래 간격을 조절
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 30
    }
    
    //셀과 콜렉션뷰의 inset을 설정 할 수 있음
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
    
}
