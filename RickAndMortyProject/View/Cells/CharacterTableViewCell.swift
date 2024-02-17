//
//  CharacterTableViewCell.swift
//  RickAndMortyProject
//
//  Created by Александр Муклинов on 16.02.2024.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    
    static let identifier = "сell"
    
    var nameLabel: UILabel = UILabel()
    var characterImageView: UIImageView = UIImageView()
    var genderLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        characterImageView.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        
        characterImageView.layer.cornerRadius = 10
        characterImageView.clipsToBounds = true
        
        addSubview(nameLabel)
        addSubview(characterImageView)
        addSubview(genderLabel)
        
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        nameLabel.text = ""
        characterImageView.image = nil
        genderLabel.text = ""
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            characterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            characterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            characterImageView.widthAnchor.constraint(equalToConstant: 90.0),
            characterImageView.heightAnchor.constraint(equalToConstant: 90.0),
            
            nameLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 16.0),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            
            genderLabel.leadingAnchor.constraint(equalTo: characterImageView.trailingAnchor, constant: 16.0),
            genderLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16.0),
            genderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0)
        ])
    }
    
    func configure(name: String, image: UIImage, gender: String) {
        nameLabel.text = name
        characterImageView.image = image
        genderLabel.text = gender
    }
}
