//
//  RecipeDetailController.swift
//  Fitlab
//
//  Created by Gul Kzm on 08.04.25.
//

import UIKit

class RecipeDetailController: UIViewController {
    
    var selectedRecipe: Recipe?
    
    
    private lazy var recipeImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "taco")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var detailView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var recipeName: UILabel = {
        let name = UILabel()
        name.text = "Healthy Taco Salad with fresh vegetable"
        name.textColor = .darkGreen
        name.numberOfLines = 0
        name.textAlignment = .left
        name.font = .systemFont(ofSize: 24, weight: .bold)
        name.translatesAutoresizingMaskIntoConstraints = false
        return name
    }()
    
    private lazy var level: UILabel = {
        let label = UILabel()
        label.text = "Easy"
        label.textColor = .grey
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .medium)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var kCalImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "kCalIcon")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var kcalLabel: UILabel = {
        let label = UILabel()
        label.text = "120 Kcal"
        label.textColor = .grey
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var time: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "timeIcon")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.text = "20 Min"
        label.textColor = .grey
        label.textAlignment = .left
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["Ingredients", "Instructions"])
        control.layer.cornerRadius = 30
        control.layer.masksToBounds = true
        control.backgroundColor = .lightGrey
        control.selectedSegmentTintColor = .darkGreen
        
        control.setTitleTextAttributes([.foregroundColor: UIColor.darkGreen, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .normal)
        control.setTitleTextAttributes([.foregroundColor: UIColor.white, .font: UIFont.systemFont(ofSize: 16, weight: .bold)], for: .selected)

        
        control.selectedSegmentIndex = 0
        
        control.translatesAutoresizingMaskIntoConstraints = false
        control.addTarget(self, action: #selector(segmentedControlChanged(_:)), for: .valueChanged)
        return control
    }()
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .none
        table.translatesAutoresizingMaskIntoConstraints = false
 
        return table
    }()
    var isFavorited = false
    
//    private lazy var favoriteButton: UIButton = {
//        let button = UIButton()
//        button.setImage(UIImage(named: "heart"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(toggleFavorite), for: .touchUpInside)
//        return button
//    }()
    
    private lazy var favorite: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "heart")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(favoriteTapped(gesture:)))
        imageView.addGestureRecognizer(tapGesture)
        imageView.isUserInteractionEnabled = true
        return imageView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.navigationBar.tintColor = .darkGreen
        segmentedControl.layer.cornerRadius = segmentedControl.bounds.height / 2
        segmentedControl.layer.masksToBounds = true
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstrainits()
        
        if let recipe = selectedRecipe {
                recipeName.text = recipe.name
                recipeImage.loadImage(from: recipe.image)
                kcalLabel.text = recipe.calories
                timeLabel.text = recipe.cookingTime
                level.text = recipe.difficulty.rawValue
            }
    }
    
    fileprivate func configureUI() {
        [recipeImage, detailView,
         recipeName,favorite,
         level, kCalImage, kcalLabel, time, timeLabel, segmentedControl, tableView
        ].forEach{view.addSubview($0)}
        
        tableView.register(IngredientsCell.self, forCellReuseIdentifier: "IngredientsCell")
        tableView.register(InstructionsCell.self, forCellReuseIdentifier: "InstructionsCell")
    }
    
    fileprivate func configureConstrainits() {
        NSLayoutConstraint.activate([
            recipeImage.topAnchor.constraint(equalTo: view.topAnchor),
            recipeImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            recipeImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            recipeImage.heightAnchor.constraint(equalToConstant: 292),
            
            favorite.topAnchor.constraint(equalTo: detailView.topAnchor, constant: 12),
           
            favorite.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12),
            favorite.heightAnchor.constraint(equalToConstant: 72),
            favorite.widthAnchor.constraint(equalToConstant: 72),
            
            detailView.topAnchor.constraint(equalTo: recipeImage.bottomAnchor,constant: -12),
            detailView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            detailView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            detailView.heightAnchor.constraint(equalToConstant: 236),
            
            recipeName.topAnchor.constraint(equalTo: recipeImage.bottomAnchor, constant: 12),
            recipeName.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            recipeName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            level.topAnchor.constraint(equalTo: recipeName.bottomAnchor, constant: 4),
            level.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            
            kCalImage.topAnchor.constraint(equalTo: level.bottomAnchor, constant: 16),
            kCalImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 28),
            kCalImage.widthAnchor.constraint(equalToConstant: 40),
            kCalImage.heightAnchor.constraint(equalToConstant: 40),
            
            kcalLabel.topAnchor.constraint(equalTo: level.bottomAnchor, constant: 24),
            kcalLabel.leadingAnchor.constraint(equalTo: kCalImage.trailingAnchor, constant: 12),
            
            time.topAnchor.constraint(equalTo: level.bottomAnchor, constant: 16),
            time.leadingAnchor.constraint(equalTo: kcalLabel.trailingAnchor,constant: 84),
            time.widthAnchor.constraint(equalToConstant: 40),
            time.heightAnchor.constraint(equalToConstant: 40),
            
            timeLabel.topAnchor.constraint(equalTo: level.bottomAnchor, constant: 24),
            timeLabel.leadingAnchor.constraint(equalTo: time.trailingAnchor, constant: 12),
            
            segmentedControl.topAnchor.constraint(equalTo: kCalImage.bottomAnchor, constant: 20),
            segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            segmentedControl.heightAnchor.constraint(equalToConstant: 52),
            
            
            tableView.topAnchor.constraint(equalTo: detailView.bottomAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
//    
//    @objc func favoriteTapped() {
//        isFavorited.toggle()
//        
//        let imageName = isFavorited ? "heart.fill" : "heart"
////        favoriteButton.setImage(UIImage(named: imageName), for: .normal)
//        favorite.image = UIImage(named: imageName)
// 
//    }
//    
    @objc private func favoriteTapped(gesture: UIGestureRecognizer) {
        isFavorited.toggle()
        
        let imageName = isFavorited ? "heart.fill" : "heart"
//        favoriteButton.setImage(UIImage(named: imageName), for: .normal)
        favorite.image = UIImage(named: imageName)
    }
    
    
    @objc func segmentedControlChanged(_ sender: UISegmentedControl) {

        segmentedControl.layer.cornerRadius = segmentedControl.bounds.height / 2
        segmentedControl.layer.masksToBounds = true
        tableView.reloadData()
    }
}

extension RecipeDetailController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch segmentedControl.selectedSegmentIndex {
            case 0:
                return selectedRecipe?.ingredients.count ?? 0
            case 1:
                return selectedRecipe?.instructions.count ?? 0
            default:
                return 0
            }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "IngredientsCell", for: indexPath) as! IngredientsCell
            
            let ingredient = selectedRecipe?.ingredients[indexPath.row]
            cell.configure(with: ingredient)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "InstructionsCell", for: indexPath) as! InstructionsCell
            
            let instruction = selectedRecipe?.instructions[indexPath.row]
            cell.configure(with: instruction, index: indexPath.row)

            return cell
        default:
            fatalError("Unexpected index")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch segmentedControl.selectedSegmentIndex
        {
        case 0:
            40
        case 1:
            40
        default:
            0
        }
    }
}
