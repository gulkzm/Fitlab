//
//  FirstOnboardingController.swift
//  Fitlab
//
//  Created by Gul Kzm on 16.04.25.
//

import UIKit

class FirstOnboardingController: UIViewController {
    
    private lazy var recipeImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "firstOnboarding")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Fuel Up with Flavor"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Explore healthy recipes designed to nourish your body and excite your taste buds. Because wellness starts in the kitchen."
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .grey
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Next"
        configuration.baseBackgroundColor = .darkGreen
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        
        let button = UIButton(configuration: configuration)
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        view.backgroundColor = .background
//        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    @objc func nextButtonTapped(){
        let controller = SecondOnboardingController()
        navigationController?.show(controller, sender: nil)
    }
    
    fileprivate func configureConstraints() {
        view.addSubview(recipeImage)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            recipeImage.topAnchor.constraint(equalTo: view.topAnchor),
            recipeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recipeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            recipeImage.heightAnchor.constraint(equalToConstant: 464),
            recipeImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -340),
            
            titleLabel.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 88),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
//            descriptionLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            nextButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44),
            nextButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            nextButton.widthAnchor.constraint(equalToConstant: 100),
            nextButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
   
}
