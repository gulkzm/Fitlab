//
//  GetStartedController.swift
//  Fitlab
//
//  Created by Gul Kzm on 16.04.25.
//

import UIKit

class GetStartedController: UIViewController {
    private lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "start")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var circleImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "iconCircle")
        image.translatesAutoresizingMaskIntoConstraints = false
  
        
        return image
    }()
    
    private lazy var appName: UILabel = {
        let name = UILabel()
        name.text = "FITLAB"
        name.textColor = .darkGreen
        name.numberOfLines = 0
        name.textAlignment = .left
        name.font = UIFont(name: "Inter-SemiBold", size: 44)
        name.translatesAutoresizingMaskIntoConstraints = false
      
        return name
    }()
    
    private lazy var slogan: UILabel = {
        let label = UILabel()
        label.text = "Eat Well, Move Well, Live Well."
        label.textColor = .darkGreen
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = UIFont(name: "Inter-Medium", size: 18)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var getStartedButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Get Started"
        configuration.baseBackgroundColor = .darkGreen
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        
        let button = UIButton(configuration: configuration)
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
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
        
        view.addSubview(iconImage)
        view.addSubview(appName)
        view.addSubview(circleImage)
        view.addSubview(slogan)
        view.addSubview(getStartedButton)
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 312),
            iconImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 74),
            iconImage.widthAnchor.constraint(equalToConstant: 76),
            iconImage.heightAnchor.constraint(equalToConstant: 100),
            
            circleImage.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 30),
            circleImage.bottomAnchor.constraint(equalTo: appName.topAnchor),
            
            appName.topAnchor.constraint(equalTo: view.topAnchor, constant: 332),
            //            appName.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
            appName.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 4),
            appName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72),
            
            slogan.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 36),
            slogan.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            getStartedButton.widthAnchor.constraint(equalToConstant: 342),
            getStartedButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc private func buttonTapped(){
        let controller = FirstOnboardingController()
        navigationController?.show(controller, sender: nil)
    }
    
    
}
