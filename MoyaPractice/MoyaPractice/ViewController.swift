//
//  ViewController.swift
//  MoyaPractice
//
//  Created by 김규철 on 2022/11/21.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    let collectionView : UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionview = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        
        return collectionview
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemPink
    }


}

