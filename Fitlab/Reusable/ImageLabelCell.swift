//
//  ImageLabelCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 03.04.25.
//

import UIKit


protocol HomeCellProtocol {
    var titleText: String { get }
}

class ImageLabelCell: UICollectionViewCell {
    
    static let identifier = "ImageLabelCell"
    
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
    
    lazy var image: UIImageView = {
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
    var isFavorited = false
    
    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "heart"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        //configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //configureUI
    
    fileprivate func configureConstraints() {
        
        addSubview(image)
        addSubview(kcalImage)
        addSubview(kcalLabel)
        addSubview(timeImage)
        addSubview(timeLabel)
        addSubview(titleLabel)
        addSubview(favoriteButton)
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            image.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            image.heightAnchor.constraint(equalToConstant: 128),
            image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            image.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -12),
            
            kcalImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            kcalImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            kcalImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -172),
            kcalImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            kcalLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            kcalLabel.leadingAnchor.constraint(equalTo: kcalImage.trailingAnchor, constant: 4),
            kcalLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            timeImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            timeImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 108),
            timeImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -76),
            timeImage.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            timeLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            timeLabel.leadingAnchor.constraint(equalTo: timeImage.trailingAnchor, constant: 4),
            timeLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            favoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            favoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            favoriteButton.heightAnchor.constraint(equalToConstant: 60),
            favoriteButton.widthAnchor.constraint(equalToConstant: 60)
        ])
    }
    
    @objc func toggleFavorite() {
        isFavorited.toggle()
        
        let imageName = isFavorited ? "heart.fill" : "heart"
        favoriteButton.setImage(UIImage(named: imageName), for: .normal)
    }
    
    func configure(with recipe: NewRecipe) {
        titleLabel.text = recipe.name
        image.loadImage(from: recipe.imageURL)
        timeLabel.text = recipe.cookingTime
        kcalLabel.text = recipe.calories
    }
    
    func configureWorkout(with workout: NewWorkout) {
        titleLabel.text = workout.name
        image.loadImage(from: workout.image)
        timeLabel.isHidden = true
        timeImage.isHidden = true
        kcalImage.isHidden = true
        kcalLabel.isHidden = true
    }
    
//    func configure(with title: String, imageURL: String) {
//        titleLabel.text = title
//        image.loadImage(from: imageURL)
//    }
}
