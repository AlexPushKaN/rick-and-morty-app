//
//  DetailView.swift
//  RickAndMortyProject
//
//  Created by Александр Муклинов on 16.02.2024.
//

import UIKit

class DetailView: UIView {
    
    let nameLabel: UILabel = UILabel()
    let statusLabel: UILabel = UILabel()
    let speciesLabel: UILabel = UILabel()
    let typeLabel: UILabel = UILabel()
    let genderLabel: UILabel = UILabel()
    let placeOfBirthLabel: UILabel = UILabel()
    let locationLabel: UILabel = UILabel()
    let imageView: UIImageView = UIImageView()
    let episodeTableView: UITableView = UITableView(frame: .zero, style: .plain)
    let createdLabel: UILabel = UILabel()
    
    var character: CharacterModel!

    required init(frame: CGRect, character: CharacterModel) {
        super.init(frame: frame)
        self.character = character
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        
        backgroundColor = .white
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        statusLabel.translatesAutoresizingMaskIntoConstraints = false
        speciesLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        genderLabel.translatesAutoresizingMaskIntoConstraints = false
        placeOfBirthLabel.translatesAutoresizingMaskIntoConstraints = false
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        episodeTableView.translatesAutoresizingMaskIntoConstraints = false
        createdLabel.translatesAutoresizingMaskIntoConstraints = false
        
        nameLabel.text = character.name
        statusLabel.text = character.status
        speciesLabel.text = character.species
        typeLabel.text = character.type
        genderLabel.text = character.gender
        placeOfBirthLabel.text = "Birth: \(character.placeOfBirth)"
        locationLabel.text = "Location: \(character.location)"
        imageView.image = UIImage(data: character.image)
        createdLabel.text = convertDateString(character.created)
        
        episodeTableView.register(EpisodsTableViewCell.self, forCellReuseIdentifier: EpisodsTableViewCell.identifier)
        
        addSubview(imageView)
        addSubview(nameLabel)
        addSubview(statusLabel)
        addSubview(speciesLabel)
        addSubview(typeLabel)
        addSubview(genderLabel)
        addSubview(placeOfBirthLabel)
        addSubview(locationLabel)
        addSubview(episodeTableView)
        addSubview(createdLabel)
        
        imageView.layer.cornerRadius = 10.0
        imageView.clipsToBounds = true
        episodeTableView.dataSource = self
        episodeTableView.delegate = self
        
        setConstraints()
    }
    
    func setValue(character: CharacterModel) {
        imageView.image = UIImage(data: character.image)
    }
    
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor, constant: 100.0),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            imageView.widthAnchor.constraint(equalToConstant: 200.0),
            imageView.heightAnchor.constraint(equalToConstant: 200.0)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 116.0),
            nameLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16.0),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            nameLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        NSLayoutConstraint.activate([
            statusLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 16.0),
            statusLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16.0),
            statusLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            statusLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        NSLayoutConstraint.activate([
            speciesLabel.topAnchor.constraint(equalTo: statusLabel.bottomAnchor, constant: 16.0),
            speciesLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 16.0),
            speciesLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            speciesLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        NSLayoutConstraint.activate([
            genderLabel.topAnchor.constraint(equalTo: speciesLabel.bottomAnchor, constant: 16.0),
            genderLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            genderLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            genderLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        NSLayoutConstraint.activate([
            placeOfBirthLabel.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: 16.0),
            placeOfBirthLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            placeOfBirthLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            placeOfBirthLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.topAnchor.constraint(equalTo: placeOfBirthLabel.bottomAnchor, constant: 16.0),
            locationLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            locationLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])

        NSLayoutConstraint.activate([
            episodeTableView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 16.0),
            episodeTableView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            episodeTableView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            episodeTableView.heightAnchor.constraint(equalToConstant: 170.0)
        ])
        
        NSLayoutConstraint.activate([
            createdLabel.topAnchor.constraint(equalTo: episodeTableView.bottomAnchor, constant: 16.0),
            createdLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            createdLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            createdLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
        
        NSLayoutConstraint.activate([
            typeLabel.topAnchor.constraint(equalTo: createdLabel.bottomAnchor, constant: 16.0),
            typeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.0),
            typeLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16.0),
            typeLabel.heightAnchor.constraint(equalToConstant: 50.0)
        ])
    }
}

//MARK: - UITableViewDataSource
extension DetailView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        character.episode.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EpisodsTableViewCell.identifier, for: indexPath) as! EpisodsTableViewCell
        cell.episodeNameLabel.text = character.episode[indexPath.row]
        return cell
    }
}

//MARK: - UITableViewDelegate
extension DetailView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
}

//MARK: - Convert DateString
extension DetailView {
    
    private func convertDateString(_ dateString: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"

        if let date = dateFormatter.date(from: dateString) {
            let outputDateFormatter = DateFormatter()
            outputDateFormatter.dateFormat = "dd MMMM yyyy"
            return outputDateFormatter.string(from: date)
        } else {
            return nil
        }
    }
}
