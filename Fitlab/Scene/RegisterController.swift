//
//  RegisterController.swift
//  Fitlab
//
//  Created by Gul Kzm on 16.04.25.
//

import UIKit

class RegisterController: UIViewController {
    
    private lazy var iconImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "start")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var loginTitle: UILabel = {
        let label = UILabel()
        label.text = "Hello! Register to get started"
        label.textColor = .darkGreen
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Bold", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userView: UIView! = {
        let view = UIView()
        view.layer.cornerRadius = 26
        view.layer.backgroundColor = UIColor.lightSea.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let fullname: UITextField = {
        let text = UITextField()
        text.placeholder = "Username"
        text.font = UIFont(name: "Inter-Medium", size: 12)
        text.textColor = .darkGreen
        text.borderStyle = .none
        text.backgroundColor = .clear
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var emailView: UIView! = {
        let view = UIView()
        view.layer.cornerRadius = 26
        view.layer.backgroundColor = UIColor.lightSea.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let email: UITextField = {
        let text = UITextField()
        text.placeholder = "Email"
        text.font = UIFont(name: "Inter-Medium", size: 12)
        text.textColor = .darkGreen
        text.borderStyle = .none
        text.backgroundColor = .clear
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private lazy var passwordView: UIView! = {
        let view = UIView()
        view.layer.cornerRadius = 26
        view.layer.backgroundColor = UIColor.lightSea.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let password: UITextField = {
        let text = UITextField()
        text.placeholder = "Password"
        text.font = UIFont(name: "Inter-Medium", size: 12)
        text.textColor = .darkGreen
        text.borderStyle = .none
        text.backgroundColor = .clear
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
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
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        
        view.backgroundColor = .background
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .background
        appearance.shadowColor = .clear
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        view.backgroundColor = .background
        
    }
    
    @objc private func registerButtonTapped(){
       
        
        let nameText = fullname.text ?? ""
        let emailText = email.text ?? ""
        let passwordText = password.text ?? ""
        let genderText = "female"
        
        if nameText.isEmpty || emailText.isEmpty || passwordText.isEmpty {
            print("Fields must not be empty")
            return
        }
        let manager = AuthManager()
//        let gender = "female"
        
        manager.register(fullname: nameText, email: emailText, password: passwordText, gender: "female") { result in
            switch result {
            case .success:
                DispatchQueue.main.async {
                    self.navigateToLoginScreen(with: emailText)
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print("❌ Registration failed: \(error.localizedDescription)")
                }
            }
        }
    }
    fileprivate func navigateToLoginScreen(with email: String) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let loginVC = storyboard.instantiateViewController(withIdentifier: "LoginController") as? LoginController {
            loginVC.prefilledEmail = email
            self.navigationController?.pushViewController(loginVC, animated: true)
        }
    }
    
    fileprivate func configureConstraints() {
        
        view.addSubview(iconImage)
        view.addSubview(loginTitle)
        view.addSubview(userView)
        view.addSubview(fullname)
        view.addSubview(emailView)
        view.addSubview(email)
        view.addSubview(passwordView)
        view.addSubview(password)
        view.addSubview(registerButton)
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 108),
            iconImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            iconImage.widthAnchor.constraint(equalToConstant: 60),
            iconImage.heightAnchor.constraint(equalToConstant: 80),
            
            loginTitle.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 20),
            loginTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            userView.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 32),
            userView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            userView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            userView.heightAnchor.constraint(equalToConstant: 52),
            
            fullname.centerYAnchor.constraint(equalTo: userView.centerYAnchor),
            fullname.leadingAnchor.constraint(equalTo: userView.leadingAnchor, constant: 16),
            fullname.trailingAnchor.constraint(equalTo: userView.trailingAnchor, constant: -16),
            
            emailView.topAnchor.constraint(equalTo: userView.bottomAnchor, constant: 16),
            emailView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            emailView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            emailView.heightAnchor.constraint(equalToConstant: 52),
            
            email.centerYAnchor.constraint(equalTo: emailView.centerYAnchor),
            email.leadingAnchor.constraint(equalTo: emailView.leadingAnchor, constant: 16),
            email.trailingAnchor.constraint(equalTo: emailView.trailingAnchor, constant: -16),
            
            passwordView.topAnchor.constraint(equalTo: emailView.bottomAnchor, constant: 16),
            passwordView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            passwordView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            passwordView.heightAnchor.constraint(equalToConstant: 52),
            
            password.centerYAnchor.constraint(equalTo: passwordView.centerYAnchor),
            password.leadingAnchor.constraint(equalTo: passwordView.leadingAnchor, constant: 16),
            password.trailingAnchor.constraint(equalTo: passwordView.trailingAnchor, constant: -16),
            
            registerButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 32),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            registerButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}

