//
//  HomeController.swift
//  Fitlab
//
//  Created by Gul Kzm on 02.04.25.
//

import UIKit

class HomeController: UIViewController {
    
    private let viewModel = HomeViewModel()
    
    private lazy var homeCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .background
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        homeCollection.dataSource = self
        homeCollection.delegate = self
        configureUI()
        configureConstraints()
        
        let navigationAppearance = UINavigationBarAppearance()
        navigationAppearance.configureWithTransparentBackground()
        navigationAppearance.backgroundColor = .clear
        navigationController?.navigationBar.scrollEdgeAppearance = navigationAppearance
        navigationController?.navigationBar.standardAppearance = navigationAppearance
        navigationController?.navigationBar.compactAppearance = navigationAppearance
        
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithTransparentBackground()
        if let tabBar = navigationController?.tabBarController?.tabBar {
            tabBar.layer.cornerRadius = 40
            tabBar.barTintColor = .white
            tabBar.layer.masksToBounds = true
        }
        navigationController?.tabBarItem.scrollEdgeAppearance = tabBarAppearance
        navigationController?.tabBarItem.standardAppearance = tabBarAppearance
    }
    
    fileprivate func configureUI() {
        [homeCollection
        ].forEach{view.addSubview($0)}
        
        homeCollection.register(HomeCell.self, forCellWithReuseIdentifier: "HomeCell")
        homeCollection.register(TopCell.self, forCellWithReuseIdentifier: "TopCell")
        homeCollection.register(HelloCell.self, forCellWithReuseIdentifier: "HelloCell")
    }
    
    fileprivate func configureConstraints() {
        NSLayoutConstraint.activate([
            homeCollection.topAnchor.constraint(equalTo: view.topAnchor, constant: -28),
            homeCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            homeCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            homeCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}
 
extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch indexPath.item{
        case 0:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HelloCell", for: indexPath) as! HelloCell
            return cell
        case 1:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
            return cell
        case 2:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopCell
            return cell
        case 3:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
            return cell
        default:
            fatalError("Unexpected index")
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.item{
        case 0:
                .init(width: collectionView.frame.width, height: 40)
        case 1:
                .init(width: collectionView.frame.width, height: 360)
        case 2:
                .init(width: collectionView.frame.width, height: 152)
        case 3:
                .init(width: collectionView.frame.width, height: 360)
        default:
            fatalError("Unexpected index")
        }
    }
}
