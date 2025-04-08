//
//  WorkoutCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 07.04.25.
//

import UIKit

class WorkoutCell: UICollectionViewCell {
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
    
    //    private lazy var playButton: UIButton = {
    //        let button = UIButton()
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        button.setImage(UIImage(systemName: "play.rectangle.fill"), for: .normal)
    //        button.tintColor = .red
    //        button.imageView?.contentMode = .scaleAspectFit
    //        button.translatesAutoresizingMaskIntoConstraints = false
    //        button.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
    //
    //        return button
    //    }()
    private lazy var playImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        //        imageView.layer.cornerRadius = 16
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "play")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        
        return imageView
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
        addSubview(playImage)
        
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            image.heightAnchor.constraint(equalToConstant: 156),
            //            image.widthAnchor.constraint(equalToConstant: 100),
            image.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -8),
            
            //            playImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            //            playImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            //            playImage.widthAnchor.constraint(equalToConstant: 60),
            //            playImage.heightAnchor.constraint(equalToConstant: 40),
            
            playImage.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            playImage.centerXAnchor.constraint(equalTo: image.centerXAnchor),
            playImage.heightAnchor.constraint(equalToConstant: 32),
            playImage.widthAnchor.constraint(equalToConstant: 44),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            //            playButton.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 16),
            
            
            
            
            
        ])
    }
    
    @objc private func imageTapped(gesture: UIGestureRecognizer) {
        if (gesture.view as? UIImageView) != nil {
            print("Image Tapped")
        }
    }
}
