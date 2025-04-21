//
//  WelcomeController.swift
//  Fitlab
//
//  Created by Gul Kzm on 16.04.25.
//

import UIKit

class WelcomeController: UIViewController {

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
    
    private lazy var loginButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Login"
        configuration.baseBackgroundColor = .lightSea
        configuration.baseForegroundColor = .darkGreen
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration)
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Register"
        configuration.baseBackgroundColor = .darkGreen
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        
        let button = UIButton(configuration: configuration)
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        self.navigationItem.backButtonDisplayMode = .minimal
        let backItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
            self.navigationItem.backBarButtonItem = backItem
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
        view.addSubview(loginButton)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 312),
            iconImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 74),
            iconImage.widthAnchor.constraint(equalToConstant: 76),
            iconImage.heightAnchor.constraint(equalToConstant: 100),
            
            circleImage.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 30),
            circleImage.bottomAnchor.constraint(equalTo: appName.topAnchor),
            
            appName.topAnchor.constraint(equalTo: view.topAnchor, constant: 332),
            appName.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 4),
            appName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72),
            
            slogan.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 36),
            slogan.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.bottomAnchor.constraint(equalTo: registerButton.topAnchor, constant: -16),
            loginButton.widthAnchor.constraint(equalToConstant: 344),
            loginButton.heightAnchor.constraint(equalToConstant: 56),
            
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
            registerButton.widthAnchor.constraint(equalToConstant: 344),
            registerButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc private func loginButtonTapped(){
        let controller = LoginController()
        navigationController?.show(controller, sender: nil)
    }
    
    @objc private func registerButtonTapped(){
        let controller = RegisterController()
        navigationController?.show(controller, sender: nil)
    }
    
    
}
