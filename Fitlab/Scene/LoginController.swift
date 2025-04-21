//
//  LoginController.swift
//  Fitlab
//
//  Created by Gul Kzm on 16.04.25.
//

import UIKit

class LoginController: UIViewController {
//    let manager = NetworkManager()
    var prefilledEmail: String?
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
        label.text = "Welcome back! Glad to see you, Again!"
        label.textColor = .darkGreen
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont(name: "Inter-Bold", size: 32)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        text.placeholder = "Enter your email"
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
        text.placeholder = "Enter your password"
        text.font = UIFont(name: "Inter-Medium", size: 12)
        text.textColor = .darkGreen
        text.borderStyle = .none
        text.backgroundColor = .clear
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    
    private lazy var loginButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "Login"
        configuration.baseBackgroundColor = .darkGreen
        configuration.baseForegroundColor = .white
        configuration.cornerStyle = .capsule
        let button = UIButton(configuration: configuration)
        button.titleLabel?.font = UIFont(name: "Inter-SemiBold", size: 16)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
        self.navigationController?.navigationBar.tintColor = .darkGreen
        self.navigationController?.navigationBar.barTintColor = .background
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureConstraints()
        view.backgroundColor = .background
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = .background
        appearance.shadowColor = .clear
        self.navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        if let emailText = prefilledEmail {
            email.text = emailText
            }
    }
    
    @objc private func loginButtonTapped(){
        let emailText = email.text ?? ""
            let passwordText = password.text ?? ""

            if emailText.isEmpty || passwordText.isEmpty {
                print("Email or password is empty")
                return
            }

            AuthService.shared.login(email: emailText, password: passwordText) { result in
                switch result {
                case .success:
                    DispatchQueue.main.async {
                        self.switchToMainTabBar()
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        print("Login failed: \(error.localizedDescription)")
                    }
                }
            }
    
    }
    
    fileprivate func switchToMainTabBar() {
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let windowSceneDelegate = scene.delegate as? UIWindowSceneDelegate,
           let window = windowSceneDelegate.window {

            let tabBarVC = UIStoryboard(name: "Main", bundle: nil)
                .instantiateViewController(withIdentifier: "UITabBarController") as! UITabBarController
            

            window?.rootViewController = tabBarVC
            window?.makeKeyAndVisible()
        }
    }
    
    fileprivate func configureConstraints() {
        
        view.addSubview(iconImage)
        view.addSubview(loginTitle)
        view.addSubview(emailView)
        view.addSubview(email)
        view.addSubview(passwordView)
        view.addSubview(password)
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            iconImage.topAnchor.constraint(equalTo: view.topAnchor, constant: 152),
            iconImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            iconImage.widthAnchor.constraint(equalToConstant: 60),
            iconImage.heightAnchor.constraint(equalToConstant: 80),
            
            loginTitle.topAnchor.constraint(equalTo: iconImage.bottomAnchor, constant: 20),
            loginTitle.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginTitle.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            emailView.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 32),
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
            
            loginButton.topAnchor.constraint(equalTo: passwordView.bottomAnchor, constant: 32),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
}
