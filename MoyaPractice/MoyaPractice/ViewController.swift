//
//  ViewController.swift
//  MoyaPractice
//
//  Created by 김규철 on 2022/11/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let response = ["시가 00시 기준", "종가 00시 기준", "저가 00시 기준", "고가 00시 기준", "거래량 00시 기준", "거래금액 00시 기준", "전일종가", "최근 24시간 거래량", "최근 24시간 거래금액", "최근 24시간 변동가", "최근 24시간 변동률", "타임 스탬프"]
    
    let coinView = CoinView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
        setCollectionView()
        setViewHierarchies()
        setConstraints()
    }
    
    func setCollectionView() {
        coinView.collectionView.delegate = self
        coinView.collectionView.dataSource = self
        coinView.collectionView.register(CoinCollectionViewCell.classForCoder(), forCellWithReuseIdentifier: CoinCollectionViewCell.id)
    }
    
    func setViewHierarchies() {
        self.view.addSubview(coinView)
    }
    func setConstraints() {
        coinView.snp.makeConstraints { make in
            make.edges.equalTo(self.view.safeAreaLayoutGuide)
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.response.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CoinCollectionViewCell.id, for: indexPath) as? CoinCollectionViewCell else {fatalError()}
        
        cell.titleLabel.text = response[indexPath.row]
        return cell
    }
    
    
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width: CGFloat = (collectionView.bounds.width - 20) / 2
        let height: CGFloat = width * 1.3
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
    }
    
    
}

