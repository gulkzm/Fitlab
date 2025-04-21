//
//  StartController.swift
//  Fitlab
//
//  Created by Gul Kzm on 16.04.25.
//

import UIKit

class StartController: UIViewController {
    
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
        image.alpha = 0
    
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
        name.alpha = 0
        return name
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureConstraints()
        animateMorphing()
//        transitionToNextController()
        
    }
    
    fileprivate func configureConstraints() {
        
        view.addSubview(iconImage)
        view.addSubview(appName)
        view.addSubview(circleImage)
        
        NSLayoutConstraint.activate([
            iconImage.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 74),
            iconImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            iconImage.widthAnchor.constraint(equalToConstant: 76),
            iconImage.heightAnchor.constraint(equalToConstant: 100),
            
            circleImage.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 30),
            circleImage.bottomAnchor.constraint(equalTo: appName.topAnchor),
            

            appName.centerYAnchor.constraint(equalTo: iconImage.centerYAnchor),
            appName.leadingAnchor.constraint(equalTo: iconImage.trailingAnchor, constant: 4),
            appName.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -72)
        ])
    }
    
    private func animateMorphing() {
         
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.appName.alpha = 1
                self.circleImage.alpha = 1
                self.applyMorphingEffect(to: "FITLAB")
                self.applyMorphingEffect(to: "iconCircle", for: self.circleImage)
                
                self.transitionToNextController()
            }
        }
        
        private func applyMorphingEffect(to label: String) {
           
            let transition = CATransition()
            transition.type = .fade
            transition.subtype = .fromTop
            transition.duration = 0.8
            transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
            
          
            appName.layer.add(transition, forKey: nil)
            
            appName.text = label
        }
    
    private func applyMorphingEffect(to imageName: String, for imageView: UIImageView) {
        let transition = CATransition()
        transition.type = .fade
        transition.subtype = .fromTop
        transition.duration = 0.8
        transition.timingFunction = CAMediaTimingFunction(name: .easeInEaseOut)
        
       
        imageView.layer.add(transition, forKey: nil)
        
        imageView.image = UIImage(named: imageName)
    }
    
    private func transitionToNextController() {
           DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
               let controller = GetStartedController()
//               self.navigationController?.navigationBar.backgroundColor = .background
//               self.navigationController?.view.backgroundColor = .background
               self.navigationController?.navigationItem.hidesBackButton = true
               self.navigationController?.navigationBar.isTranslucent = false
//               self.navigationController?.pushViewController(nextController, animated: true)
               
               self.navigationController?.show(controller, sender: nil)
           }
       }
    
    
}
