//
//  CategoryCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 03.04.25.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    private lazy var categoryButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Breakfast"
        configuration.baseBackgroundColor = .lightGrey
        configuration.baseForegroundColor = .darkGreen
        configuration.cornerStyle = .capsule

        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(categoryButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func categoryButtonTapped(){
        
    }
    
    func configureConstraints(){
        addSubview(categoryButton)
        
        NSLayoutConstraint.activate([
            categoryButton.topAnchor.constraint(equalTo: topAnchor),
            categoryButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            categoryButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryButton.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
