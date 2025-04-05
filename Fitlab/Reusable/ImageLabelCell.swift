//
//  ImageLabelCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 03.04.25.
//

import UIKit

class ImageLabelCell: UICollectionViewCell {
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "taco")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Healthy Taco Salad with fresh vegetable"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureConstraints() {
        addSubview(titleLabel)
        addSubview(image)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            image.topAnchor.constraint(equalTo: topAnchor/*, constant: 8*/),
            image.leadingAnchor.constraint(equalTo: leadingAnchor/*, constant: 8*/),
            image.trailingAnchor.constraint(equalTo: trailingAnchor/*, constant: -8*/),
//            image.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -8)
            image.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8)
        ])
    }
}
