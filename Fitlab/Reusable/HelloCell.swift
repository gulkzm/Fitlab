//
//  HelloCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 04.04.25.
//

import UIKit

class HelloCell: UICollectionViewCell {
    private lazy var helloLabel: UILabel = {
        let label = UILabel()
        label.text = "Hello!"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .darkGreen
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCoonstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   fileprivate func configureCoonstraints() {
        addSubview(helloLabel)
        
        NSLayoutConstraint.activate([
            helloLabel.topAnchor.constraint(equalTo: topAnchor),
            helloLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            helloLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            helloLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
