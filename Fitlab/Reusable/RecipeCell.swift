//
//  RecipeCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 07.04.25.
//

import UIKit

class RecipeCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Healthy Taco Salad with fresh vegetable"
        label.textColor = .darkGreen
        label.textAlignment = .left
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "taco")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var kcalImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "kcal")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var kcalLabel: UILabel = {
        let label = UILabel()
        label.text = "120 Kcal"
        label.textColor = .grey
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var timeImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "time")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "20 Min"
        label.textColor = .grey
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 14, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
        private lazy var arrowButton: UIButton = {
            let button = UIButton()
            button.translatesAutoresizingMaskIntoConstraints = false
            button.setImage(UIImage(named: "arrow"), for: .normal)
            button.imageView?.contentMode = .scaleAspectFit
            button.translatesAutoresizingMaskIntoConstraints = false
            button.addTarget(self, action: #selector(arrowButtonTapped), for: .touchUpInside)
            return button
        }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureConstraints() {
        
        addSubview(image)
        addSubview(titleLabel)
        addSubview(kcalImage)
        addSubview(kcalLabel)
        addSubview(timeImage)
        addSubview(timeLabel)
        addSubview(arrowButton)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            image.widthAnchor.constraint(equalToConstant: 100),
            
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -48),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -44),
            
            kcalImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            kcalImage.leadingAnchor.constraint(equalTo: image.trailingAnchor, constant: 16),
            kcalImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -188),
            kcalImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            kcalLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            kcalLabel.leadingAnchor.constraint(equalTo: kcalImage.trailingAnchor, constant: 4),
            kcalLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            timeImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            timeImage.leadingAnchor.constraint(equalTo: kcalLabel.trailingAnchor, constant: 20),
            timeImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4),
            timeLabel.leadingAnchor.constraint(equalTo: timeImage.trailingAnchor, constant: 4),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
            arrowButton.heightAnchor.constraint(equalToConstant: 24),
            arrowButton.widthAnchor.constraint(equalToConstant: 24),
            arrowButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            arrowButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
    
    @objc private func arrowButtonTapped() {
        print("Button Tapped")
    }
}
