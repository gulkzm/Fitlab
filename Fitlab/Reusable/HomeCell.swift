//
//  HomeCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 02.04.25.
//

import UIKit

class HomeCell: UICollectionViewCell {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "New Recipes"
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    private lazy var seeAllButton: UIButton = {
        let button = UIButton()
        button.setTitle("See All", for: .normal)
        button.setTitleColor(.sea, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(seeAllButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var categoryCollection: UICollectionView = {
        let layout1 = UICollectionViewFlowLayout()
        layout1.scrollDirection = .horizontal
        layout1.minimumLineSpacing = 20
        layout1.minimumInteritemSpacing = 16
        layout1.sectionInset = .init(top: 0, left: 24, bottom: 0, right: 0)
        
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
        layout2.sectionInset = .init(top: 0, left: 24, bottom: 0, right: 0)
        
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
        categoryCollection.dataSource = self
        categoryCollection.delegate = self
        
        collection.dataSource = self
        collection.delegate = self
        
        
        
        categoryCollection.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        collection.register(ImageLabelCell.self, forCellWithReuseIdentifier: "ImageLabelCell")
        
        //        collection.tag = 2
        
        //        categoryCollection.tag = 1
        
    }
    fileprivate func configureConstraints() {
        addSubview(titleLabel)
        addSubview(seeAllButton)
        addSubview(categoryCollection)
        addSubview(collection)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 28),
            seeAllButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            seeAllButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            categoryCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
//            categoryCollection.bottomAnchor.constraint(equalTo: bottomAnchor),
            categoryCollection.heightAnchor.constraint(equalToConstant: 40),
           
            categoryCollection.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryCollection.trailingAnchor.constraint(equalTo: trailingAnchor),
            collection.topAnchor.constraint(equalTo: categoryCollection.bottomAnchor, constant: 8),
            
            collection.bottomAnchor.constraint(equalTo: bottomAnchor),
            collection.leadingAnchor.constraint(equalTo: leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    @objc private func seeAllButtonTapped(){
        
    }
}

extension HomeCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == categoryCollection {
            return 5
        } else {
            return 20
        }
    
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == categoryCollection {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
//            cell.backgroundColor = .blue
            return cell
        } else  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageLabelCell", for: indexPath) as! ImageLabelCell
            cell.backgroundColor = .red
            cell.layer.cornerRadius = 16
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == categoryCollection{
            .init(width: 120, height: 44)
        } else {
            .init(width: 200, height: 240)
        }
    }
}
