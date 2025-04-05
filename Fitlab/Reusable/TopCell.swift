//
//  TopCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 04.04.25.
//

import UIKit

class TopCell: UICollectionViewCell {
    private lazy var imageAI: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 16
        image.image = UIImage(named: "AIMeal")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
//    private lazy var imageAIMeal: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleAspectFill
//        image.clipsToBounds = true
//        image.layer.cornerRadius = 16
//        image.image = UIImage(named: "AIFood")
//        image.translatesAutoresizingMaskIntoConstraints = false
//        return image
//    }()
    
    private lazy var aiLabel: UILabel = {
        let label = UILabel()
        label.text = "Learn your meal calorie with AI"
        label.textAlignment = .left
        label.numberOfLines = 0
//        label.font = .systemFont(ofSize: 32, weight: .bold)
        label.textColor = .white
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
//    private lazy var buttonAI: UIButton = {
//        let button = UIButton()
//        button.setTitle("Capture Meal", for: .normal)
//        button.setTitleColor(.blue, for: .normal)
//        button.tintColor = .darkGreen
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(buttonAITapped), for: .touchUpInside)
//        return button
//    
//    }()
    private lazy var buttonAI: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Capture Meal"
        configuration.baseBackgroundColor = .darkGreen
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAITapped), for: .touchUpInside)
        return button
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
       
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    func configureConstraints(){
        addSubview(imageAI)
//        addSubview(imageAIMeal)
        addSubview(aiLabel)
        addSubview(buttonAI)
        
        NSLayoutConstraint.activate([
            imageAI.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            imageAI.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageAI.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageAI.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            
//            imageAIMeal.topAnchor.constraint(equalTo: topAnchor, constant: 12),
//            imageAIMeal.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 100),
//            imageAIMeal.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16),
//            imageAIMeal.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
//            aiLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            aiLabel.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            aiLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32),
            aiLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -140),
            
            buttonAI.topAnchor.constraint(equalTo: aiLabel.bottomAnchor, constant: 12),
//            buttonAI.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
            buttonAI.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 32)
        ])
    }
    
    @objc private func buttonAITapped(){
        
    }
    
    
}
