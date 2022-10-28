//
//  AnotherFlowLayoutPracticeCell.swift
//  CollectionViewPractice
//
//  Created by qualson1 on 2022/10/29.
//

import UIKit

class AnotherFlowLayoutPracticeCell: UICollectionViewCell {
    
    static let id = "AnotherFlowLayoutPracticeCell"
    static let imageConfig = UIImage.SymbolConfiguration(pointSize: CGFloat(28))
    static let faceImageConfig = UIImage.SymbolConfiguration(pointSize: CGFloat(120))
    
    var faceimage: UIImage?
    var checkImage: UIImage?
    var noneCheckImage: UIImage?
    
    var faceImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 10
        imageView.layer.borderColor = UIColor.systemRed.cgColor
        imageView.layer.borderWidth = 1.5
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "face.jpg")
        return imageView
    }()
    
     var checkImageView: UIImageView = {
        let checkImageView = UIImageView()
        checkImageView.translatesAutoresizingMaskIntoConstraints = false
        checkImageView.clipsToBounds = true
        checkImageView.layer.cornerRadius = CGFloat(28) / 2.0
        checkImageView.layer.borderWidth = 2
        checkImageView.image = UIImage(systemName: "checkmark.circle.fill", withConfiguration: imageConfig)
        return checkImageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setViewHierarchy()
        setConstraints()
//      setupImages()
//      setupcheckImageView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setViewHierarchy() {
        contentView.addSubview(faceImageView)
        contentView.addSubview(checkImageView)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate(
            [
                faceImageView.widthAnchor.constraint(equalTo: contentView.widthAnchor),
                faceImageView.heightAnchor.constraint(equalTo: contentView.heightAnchor),
                checkImageView.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor, constant: 10),
                checkImageView.trailingAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.trailingAnchor, constant: 5),
                checkImageView.widthAnchor.constraint(equalToConstant: CGFloat(28)),
                checkImageView.heightAnchor.constraint(equalTo: checkImageView.widthAnchor)
            ]
        )
    }
    
//    private func setupImages() {
//          let imageConfig = UIImage.SymbolConfiguration(pointSize: CGFloat(28))
//          let faceImageConfig = UIImage.SymbolConfiguration(pointSize: CGFloat(120))
//          noneCheckImage = UIImage(systemName: "circle.fill", withConfiguration: imageConfig)
//          checkImage = UIImage(systemName: "checkmark.circle.fill", withConfiguration: imageConfig)
//          faceimage = UIImage(systemName: "face.jpg", withConfiguration: faceImageConfig)
//      }
    
//    func setupcheckImageView() {
//        checkImageView = UIImageView()
//        checkImageView.image = noneCheckImage
//    }
    
//    func configuration() {
//        faceImageView.image = self.faceimage
//    }
    
}
