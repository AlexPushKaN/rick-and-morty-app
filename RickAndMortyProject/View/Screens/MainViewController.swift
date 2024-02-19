//
//  MainViewController.swift
//  RickAndMortyProject
//
//  Created by Александр Муклинов on 15.02.2024.
//

import UIKit

class MainViewController: UIViewController {
   
    let mainViewModel = MainViewModel()
    let mainView = MainView()
    
    lazy var cachedDataSourse: NSCache<AnyObject, UIImage> = {
        let cache = NSCache<AnyObject, UIImage>()
        return cache
    }()
    
    init() {
        super.init(nibName: nil, bundle: nil)
        title = "List characters"
        bindMainViewModel()
        mainViewModel.loadCharacters(from: "https://rickandmortyapi.com/api/character")
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
        mainView.tableView.dataSource = self
        mainView.tableView.delegate = self
    }
    
    private func bindMainViewModel() {
        mainViewModel.characters.bind { [weak self] _ in
            self?.mainView.tableView.reloadData()
        }
    }
}

//MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if mainViewModel.characters.value.count > 0 {
            mainView.activityIndicator.stopAnimating()
        }
        return mainViewModel.characters.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let character = mainViewModel.characters.value[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.identifier, for: indexPath) as! CharacterTableViewCell
        
        if let cachedImage = cachedDataSourse.object(forKey: character.image as AnyObject) {
            cell.configure(name: character.name, image: cachedImage, gender: character.gender)
        } else {
            if let characterImage = UIImage(data: character.image) {
                cachedDataSourse.setObject(characterImage, forKey: character.image as AnyObject)
                cell.configure(name: character.name, image: characterImage, gender: character.gender)
            }
        }
        return cell
    }
}

//MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let character = mainViewModel.characters.value[indexPath.row]
        navigationController?.pushViewController(DetailViewController(for: character), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
