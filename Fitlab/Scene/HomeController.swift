//
//  HomeController.swift
//  Fitlab
//
//  Created by Gul Kzm on 02.04.25.
//

import UIKit

class HomeController: UIViewController {

    @IBOutlet weak var collection: UICollectionView!
    private let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.dataSource = self
        collection.delegate = self
        configureUI()
    }
    
    fileprivate func configureUI() {
        collection.register(HomeCell.self, forCellWithReuseIdentifier: "HomeCell")
        collection.register(TopCell.self, forCellWithReuseIdentifier: "TopCell")
        collection.register(HelloCell.self, forCellWithReuseIdentifier: "HelloCell")
    }
    

}
 
extension HomeController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        switch indexPath.item{
//        case 0:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TopCell", for: indexPath) as! TopCell
//            return cell
//        case 1,2:
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
//            return cell
//        default:
//            fatalError("Unexpected index")
//        }
//    }
    
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
                .init(width: collectionView.frame.width, height: 340)
        case 2:
                .init(width: collectionView.frame.width, height: 168)
        case 3:
                .init(width: collectionView.frame.width, height: 340)
        default:
            fatalError("Unexpected index")
        }
    }
}
