//
//  ThirdOnboardingController.swift
//  Fitlab
//
//  Created by Gul Kzm on 16.04.25.
//

import UIKit

class ThirdOnboardingController: UIViewController {
    private lazy var aiImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "thirdOnboarding")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Effortless Meal Nutrients Analysis"
        label.textAlignment = .left
        label.textColor = .black
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "Snap a pic of your meal, and unlock a treasure trove of nutritional insights! From calories to macros, we’ve got you covered. Eat smarter, not harder!"
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .grey
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var doneButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Done"
        configuration.baseBackgroundColor = .darkGreen
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        
        let button = UIButton(configuration: configuration)
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(doneButtonTapped), for: .touchUpInside)
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
    
    fileprivate func configureConstraints() {
        view.addSubview(aiImage)
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(doneButton)
        
        NSLayoutConstraint.activate([
            aiImage.topAnchor.constraint(equalTo: view.topAnchor),
            aiImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            aiImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            aiImage.heightAnchor.constraint(equalToConstant: 464),
            aiImage.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -340),
            
            titleLabel.topAnchor.constraint(equalTo: aiImage.bottomAnchor, constant: 88),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            descriptionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            descriptionLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            doneButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -44),
            doneButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16),
            doneButton.widthAnchor.constraint(equalToConstant: 100),
            doneButton.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    @objc private func doneButtonTapped(){
        let controller = WelcomeController()
        navigationController?.show(controller, sender: nil)
        
//                let controller = UITabBarController()
//                navigationController?.show(controller, sender: nil)
//        
//        let controller = storyboard?.instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
//        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
//        guard let window = windowScene.windows.first else { return }
//        window.rootViewController = controller
//        window.makeKeyAndVisible()
        
    }
}



