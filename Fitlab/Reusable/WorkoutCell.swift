//
//  WorkoutCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 07.04.25.
//

import UIKit

protocol WorkoutCellDelegate: AnyObject {
    func didTapPlayButton(for workout: Workout)
}

class WorkoutCell: UICollectionViewCell {
    
    weak var delegate: WorkoutCellDelegate?
     private var workout: Workout?
    
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
    
    private lazy var playImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "play")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(imageTapped(gesture:)))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
//    protocol WorkoutCellDelegate: AnyObject {
//        func didTapPlayButton(for workout: Workout)
//    }
    
//    func didTapPlayButton(for workout: Workout) {
//        let correctedURLString = workout.videoURL.replacingOccurrences(of: "httpshttps", with: "https")
//        guard let url = URL(string: correctedURLString) else {
//            print("❌ Invalid video URL")
//            return
//        }
//
//        let safariVC = SFSafariViewController(url: url)
//        present(safariVC, animated: true)
//    }

    
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
            image.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -8),
            
            playImage.centerYAnchor.constraint(equalTo: image.centerYAnchor),
            playImage.centerXAnchor.constraint(equalTo: image.centerXAnchor),
            playImage.heightAnchor.constraint(equalToConstant: 32),
            playImage.widthAnchor.constraint(equalToConstant: 44),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    @objc private func imageTapped(gesture: UIGestureRecognizer) {
//        if (gesture.view as? UIImageView) != nil {
//            print("Image Tapped")
//        }
        
        guard let workout = workout else { return }
               delegate?.didTapPlayButton(for: workout)
    }
    
    func configure(with workout: Workout) {
        self.workout = workout
        titleLabel.text = workout.name
        image.loadImage(from: workout.image)
    }
}
