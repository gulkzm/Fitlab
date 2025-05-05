//
//  InstructionsCell.swift
//  Fitlab
//
//  Created by Gul Kzm on 11.04.25.
//

import UIKit

class InstructionsCell: UITableViewCell {
    private lazy var circleImage: UIImageView = {
        let image = UIImageView()
        image.clipsToBounds = true
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "circle")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var stepsLabel: UILabel = {
        let l  = UILabel()
        l.text = "1"
        l.textAlignment = .left
        l.font = .systemFont(ofSize: 12,  weight: .semibold)
        l.textColor = .white
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    private var insLabel: UILabel = {
        let l  = UILabel()
        l.text = "Your recipe has been uploaded, you can see it on your profile. Your recipe has been uploaded, you can see it on your"
        l.textAlignment = .left
        l.numberOfLines = 0
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
    
    func configure(with instruction: Instruction?, index: Int) {
        let text = instruction?.rawValue ?? ""
         insLabel.text = "\(text)"
        
        stepsLabel.text = "\(index + 1)"
        }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    fileprivate func configureConstraints () {
        addSubview(circleImage)
        addSubview(stepsLabel)
        addSubview(insLabel)
        
        NSLayoutConstraint.activate([
            circleImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            circleImage.heightAnchor.constraint(equalToConstant: 24),
            circleImage.widthAnchor.constraint(equalToConstant: 24),
            circleImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            stepsLabel.centerYAnchor.constraint(equalTo: circleImage.centerYAnchor),
            stepsLabel.centerXAnchor.constraint(equalTo: circleImage.centerXAnchor),
            
            insLabel.leadingAnchor.constraint(equalTo: circleImage.trailingAnchor, constant: 12),
            insLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            
            insLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
