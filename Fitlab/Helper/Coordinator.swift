//
//  Coordinator.swift
//  Fitlab
//
//  Created by Gul Kzm on 24.04.25.
//

import UIKit
import Foundation

protocol Coordinator {
//    var children: [UIViewController] { get }
    var navigationController: UINavigationController { get }
    
    func start()
}
