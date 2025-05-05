//
//  WorkoutsController.swift
//  Fitlab
//
//  Created by Gul Kzm on 07.04.25.
//

import UIKit
import SafariServices
//
//protocol WorkoutCellDelegate: AnyObject {
//    func didTapPlayButton(for workout: Workout)
//}

class WorkoutsController: UIViewController {
    let viewModel = WorkoutViewModel()

    let refreshControl = UIRefreshControl()
    
    private lazy var searchView: UIView! = {
        let view = UIView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.darkGreen.cgColor
        view.layer.cornerRadius = 16
        view.layer.borderColor = UIColor.lightGrey.cgColor
        view.layer.backgroundColor = UIColor.background.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let searchField: UITextField = {
        let t = UITextField()
        t.placeholder = "Search for a workout"
        t.font = .systemFont(ofSize: 16)
        t.textColor = .grey
        t.borderStyle = .none
        t.backgroundColor = .clear
        t.translatesAutoresizingMaskIntoConstraints = false
        return t
    }()
    
    private lazy var searchImage: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(systemName: "magnifyingglass")
        imageView.tintColor = .darkGreen
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var workoutCollection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.collectionView?.backgroundColor = .background
        layout.minimumLineSpacing = 16
        layout.minimumInteritemSpacing = 16
        layout.sectionInset = .init(top: 0, left: 24, bottom: 16, right: 24)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .background
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
        configureViewModel()
        
        workoutCollection.delegate = self
        workoutCollection.dataSource = self
        
        viewModel.getWorkoutList()
        
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
        [workoutCollection, searchView,
         searchField,
         searchImage
        ].forEach{view.addSubview($0)}
        
//        workoutCollection.dataSource = self
//        workoutCollection.delegate = self
        
        refreshControl.addTarget(self, action: #selector(pullToRefresh), for: .valueChanged)
        workoutCollection.refreshControl = refreshControl
        
        workoutCollection.register(WorkoutCell.self, forCellWithReuseIdentifier: "WorkoutCell")
    }
    
    func configureViewModel() {
        viewModel.success = { [weak self] in
            DispatchQueue.main.async {
                self?.workoutCollection.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }

        viewModel.error = { [weak self] errorMessage in
            print("❌ Error: \(errorMessage)")
            DispatchQueue.main.async {
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    @objc func pullToRefresh() {
        viewModel.reset()
        viewModel.getWorkoutList()
    }
    
    fileprivate func configureConstraints() {
        NSLayoutConstraint.activate([
            
            searchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            searchView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            searchView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            searchView.heightAnchor.constraint(equalToConstant: 56),
            
            searchImage.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchImage.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 16),
            searchImage.heightAnchor.constraint(equalToConstant: 24),
            searchImage.widthAnchor.constraint(equalToConstant: 24),
            
            searchField.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchField.leadingAnchor.constraint(equalTo: searchImage.trailingAnchor, constant: 16),
            searchField.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -20),
            
            workoutCollection.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 16),
            workoutCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            workoutCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            workoutCollection.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
        ])
    }
}

extension WorkoutsController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        40
        return viewModel.numberOfWorkouts
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutCell", for: indexPath) as? WorkoutCell else {
               fatalError("Could not dequeue RecipeCell")
           }
        let workout = viewModel.workout(at: indexPath.item)
        cell.configure(with: workout)
        cell.delegate = self

        cell.backgroundColor = .cell
        cell.layer.cornerRadius = 16
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.layer.shadowRadius = 8
        cell.layer.masksToBounds = false
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: 340, height: 220)
    }
}


extension WorkoutsController: WorkoutCellDelegate {
    func didTapPlayButton(for workout: Workout) {
        let urlString = workout.videoURL
        guard let url = URL(string: urlString) else {
            print("❌ Invalid video URL")
            return
        }

        let safariVC = SFSafariViewController(url: url)
        present(safariVC, animated: true)
    }
}
