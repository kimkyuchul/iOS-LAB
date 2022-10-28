//
//  FlowLayoutPracticeCell.swift
//  CollectionViewPractice
//
//  Created by qualson1 on 2022/10/28.
//

import UIKit

class FlowLayoutPracticeCell: UICollectionViewCell {
    
    static let id = "FlowLayoutPracticeCell"
    
    let title: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViewHierarchy()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewHierarchy() {
        contentView.addSubview(title)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate(
            [
                title.topAnchor.constraint(equalTo: contentView.topAnchor),
                title.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
                title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
                title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor)
            ]
        )
    }
    
    func configuration(title text: String) {
        title.text = text
    }
    
}
