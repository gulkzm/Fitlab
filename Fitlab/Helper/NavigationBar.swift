////
////  NavigationBar.swift
////  Fitlab
////
////  Created by Gul Kzm on 02.04.25.
////
//
//import UIKit
//class NavigationBar {
//    
//    private lazy var helloLabel: UILabel = {
//        let label = UILabel()
//        label.text = "Hello!"
//        label.textAlignment = .center
//        label.font = .systemFont(ofSize: 20, weight: .bold)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        return label
//    }()
//    
//    private lazy var nameLabel: UILabel = {
//        let name = UILabel()
//        name.text = "Gul"
//        name.textAlignment = .center
//        name.font = .systemFont(ofSize: 20, weight: .bold)
//        name.translatesAutoresizingMaskIntoConstraints = false
//        return name
//    }()
//    
//    private lazy var mainStack: UIStackView = {
//        var stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = 10
//        stackView.distribution = .fillEqually
//        stackView.alignment = .fill
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//
//        return stackView
//    }()
//    
//    let container = UIView()
//    container.addSubview(mainStack)
//    
//    func configureUI() {
//        
//        mainStack.addArrangedSubview(helloLabel)
//        mainStack.addArrangedSubview(nameLabel)
//        
//        [helloLabel,
//         nameLabel,
//         mainStack
//        ].forEach{container.addSubview($0)}
//    }
//    
//    func configureConstraints() {
//        NSLayoutConstraint.activate([
//            helloLabel.topAnchor.constraint(equalTo: container.topAnchor),
//            helloLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
//            helloLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
//            
//            nameLabel.topAnchor.constraint(equalTo: container.bottomAnchor),
//            nameLabel.leadingAnchor.constraint(equalTo: container.leadingAnchor),
//            nameLabel.trailingAnchor.constraint(equalTo: container.trailingAnchor),
//            
//            mainStack.topAnchor.constraint(equalTo: container.bottomAnchor),
//            mainStack.heightAnchor.constraint(equalToConstant: 60),
//            mainStack.leadingAnchor.constraint(equalTo: container.leadingAnchor),
//            mainStack.trailingAnchor.constraint(equalTo: container.trailingAnchor)
//            ])
//        
//        let customItem = UIBarButtonItem(customView: container)
//        self.navigationItem.leftBarButtonItem = customItem
//}
//        }
