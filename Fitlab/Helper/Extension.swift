//
//  Extension.swift
//  Fitlab
//
//  Created by Gul Kzm on 22.04.25.
//

import Foundation
import UIKit

extension UIImageView {
    func loadImage(from urlString: String) {
        guard let url = URL(string: urlString), urlString != "" else {
            self.image = UIImage(named: "placeholder") // default image
            return
        }
        URLSession.shared.dataTask(with: url) { data, _, error in
            guard let data = data, error == nil, let downloadedImage = UIImage(data: data) else {
                DispatchQueue.main.async {
                    self.image = UIImage(named: "placeholder") // fallback image
                }
                return
            }
            DispatchQueue.main.async {
                self.image = downloadedImage
            }
        }.resume()
    }
}

