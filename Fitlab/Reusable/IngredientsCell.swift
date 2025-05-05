//
//  IngredientsCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 10.04.25.
//

import UIKit

class IngredientsCell: UITableViewCell {

    private lazy var checkImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "check")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var ingLabel: UILabel = {
        let l  = UILabel()
        l.text = "4 Eggs"
        l.textAlignment = .left
        l.font = .systemFont(ofSize: 16,  weight: .medium)
        l.textColor = .darkGreen
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(with ingredient: Ingredient?) {
        let quantity = ingredient?.quantity ?? ""
         let unit = ingredient?.unit.rawValue ?? ""
         let name = ingredient?.name.rawValue ?? ""

         ingLabel.text = "\(name) \(quantity) \(unit)"
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func configureConstraints () {
        addSubview(checkImage)
        addSubview(ingLabel)
        
        NSLayoutConstraint.activate([
            checkImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            checkImage.heightAnchor.constraint(equalToConstant: 24),
            checkImage.widthAnchor.constraint(equalToConstant: 24),
            checkImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            ingLabel.leadingAnchor.constraint(equalTo: checkImage.trailingAnchor, constant: 12),
            
            ingLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }

}
