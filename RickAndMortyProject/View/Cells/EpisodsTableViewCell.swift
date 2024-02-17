//
//  EpisodsTableViewCell.swift
//  RickAndMortyProject
//
//  Created by Александр Муклинов on 17.02.2024.
//

import UIKit

class EpisodsTableViewCell: UITableViewCell {
    
    static let identifier = "сell"
    
    var episodeNameLabel: UILabel = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        episodeNameLabel.translatesAutoresizingMaskIntoConstraints = false
        episodeNameLabel.numberOfLines = 0
        addSubview(episodeNameLabel)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        episodeNameLabel.text = ""
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            episodeNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16.0),
            episodeNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            episodeNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
        ])
    }
}
