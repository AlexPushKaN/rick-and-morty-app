//
//  MainView.swift
//  RickAndMortyProject
//
//  Created by Александр Муклинов on 16.02.2024.
//

import UIKit

class MainView: UIView {
    
    private(set) var activityIndicator = UIActivityIndicatorView(style: .large)
    private(set) var tableView = UITableView(frame: .zero, style: .plain)
    
    var viewModel: MainViewModel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        activityIndicator.startAnimating()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        tableView.register(CharacterTableViewCell.self, forCellReuseIdentifier: CharacterTableViewCell.identifier)
        
        addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.widthAnchor.constraint(equalTo: self.widthAnchor),
            tableView.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
        
        addSubview(activityIndicator)
        activityIndicator.color = #colorLiteral(red: 0, green: 0.9768045545, blue: 0, alpha: 1).withAlphaComponent(0.8)
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor)
        ])
    }
}
