//
//  HomeCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 02.04.25.
//

import UIKit

class HomeCell: UICollectionViewCell {
    private var recipes: [NewRecipe] = []
    private var workouts: [NewWorkout] = []
    
    var isWorkoutCell: Bool = false
    
//    enum HomeCellType {
//        case header
//        case recipes(NewRecipe)
//        case ai
//        case workouts(NewWorkout)
//
//    }
//    
//    var cellType: HomeCellType?
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "New Recipes"
        label.textAlignment = .center
        label.textColor = .darkGreen
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
//    private lazy var seeAllButton: UIButton = {
//        let button = UIButton()
//        button.setTitle("See All", for: .normal)
//        button.setTitleColor(.sea, for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
//        return button
//    }()
    
    private lazy var categoryCollection: UICollectionView = {
        let layout1 = UICollectionViewFlowLayout()
        layout1.scrollDirection = .horizontal
        layout1.minimumLineSpacing = 16
        layout1.minimumInteritemSpacing = 16
        layout1.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        let categoryCollection = UICollectionView(frame: .zero, collectionViewLayout: layout1)
        categoryCollection.showsHorizontalScrollIndicator = false
        categoryCollection.backgroundColor = .background
        categoryCollection.translatesAutoresizingMaskIntoConstraints = false
        return categoryCollection
    }()
    
    private lazy var collection: UICollectionView = {
        let layout2 = UICollectionViewFlowLayout()
        layout2.scrollDirection = .horizontal
        layout2.minimumLineSpacing = 16
        layout2.minimumInteritemSpacing = 16
        layout2.sectionInset = .init(top: 0, left: 16, bottom: 0, right: 16)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout2)
        collection.backgroundColor = .background
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate func configureUI() {
//        categoryCollection.dataSource = self
//        categoryCollection.delegate = self
        
        collection.dataSource = self
        collection.delegate = self
        
//       categoryCollection.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collection.register(ImageLabelCell.self, forCellWithReuseIdentifier: "ImageLabelCell")
    }
    
    fileprivate func configureConstraints() {
        addSubview(titleLabel)
//        addSubview(seeAllButton)
//        addSubview(categoryCollection)
        addSubview(collection)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
//            seeAllButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
//            seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
//            categoryCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
//            categoryCollection.heightAnchor.constraint(equalToConstant: 40),
//            categoryCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
//            categoryCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            collection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            collection.bottomAnchor.constraint(equalTo: bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    func configure(title: String, recipes: [NewRecipe]) {
        titleLabel.text = title
        self.isWorkoutCell = false
        self.recipes = recipes
        collection.reloadData()
    }
    
    func configureWorkout(title: String, workouts: [NewWorkout]) {
        titleLabel.text = title
        self.isWorkoutCell = true
        self.workouts = workouts
        collection.reloadData()
    }
   
    
    let controller = HomeController()
    let cell = ImageLabelCell()

    @objc private func seeAllButtonTapped(){
        
    }
}

extension HomeCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//            return 20
        isWorkoutCell ? workouts.count : recipes.count
            
//        switch cellType {
//           case .recipes(let recipes):
//            return recipes.count
//           case .workouts(let workouts):
//            return workouts.count
//           default:
//               return 0
//           }
        
//        return !recipes.isEmpty ? recipes.count : workouts.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageLabelCell", for: indexPath) as! ImageLabelCell
        cell.backgroundColor = .cell
        cell.layer.cornerRadius = 16
        cell.layer.shadowColor = UIColor.black.cgColor
        cell.layer.shadowOpacity = 0.1
        cell.layer.shadowOffset = CGSize(width: 0, height: 4)
        cell.layer.shadowRadius = 4
        cell.layer.masksToBounds = false
        
//        if !recipes.isEmpty {
//            let recipe = recipes[indexPath.item]
//            cell.configure(with: recipe)
//        } else if !workouts.isEmpty {
//            let workout = workouts[indexPath.item]
//            cell.configureWorkout(with: workout)
//        }
//        switch cellType {
//            case .recipes(let recipes):
//                let recipe = recipes[indexPath.item]
//                cell.configure(with: recipe)
//            case .workouts(let workouts):
//                let workout = workouts[indexPath.item]
//                cell.configureWorkout(with: workout)
//            default:
//                break
//            }
        
//       cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageLabelCell", for: indexPath) as! ImageLabelCell
              if isWorkoutCell {
                  let workout = workouts[indexPath.item]
                         cell.configureWorkout(with: workout)
//                  cell.configure(title: workout.name, imageUrl: workout.image)
              } else {
                  let recipe = recipes[indexPath.item]
                
                                 cell.configure(with: recipe)
//                  cell.configure(title: recipe.name, imageUrl: recipe.image)
              }
            return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            .init(width: 200, height: 240)
    }
}
