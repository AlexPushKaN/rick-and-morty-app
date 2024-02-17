//
//  DetailViewController.swift
//  RickAndMortyProject
//
//  Created by Александр Муклинов on 16.02.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    var detailView: DetailView!
    
    init(for character: CharacterModel) {
        super.init(nibName: nil, bundle: nil)
        detailView = DetailView(frame: UIScreen.accessibilityFrame(), character: character)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = detailView
    }
}
