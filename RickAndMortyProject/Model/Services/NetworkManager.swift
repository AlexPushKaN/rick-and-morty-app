//
//  NetworkManager.swift
//  RickAndMortyProject
//
//  Created by Александр Муклинов on 15.02.2024.
//

import Foundation

class NetworkManager {
    
    static func getInfo(from resorce: String, completion: @escaping ([CharacterModel]) -> Void) {
        guard let url = URL(string: resorce) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let response = response, (response as! HTTPURLResponse).statusCode == 200 else {
                    print((response as! HTTPURLResponse).statusCode.description)
                    return
                }
                if let data = data {
                    do {
                        let jsonData = try JSONDecoder().decode(CharactersAPIResponse.self, from: data)
                        var characters: [CharacterModel] = []
                        for result in jsonData.results {
                            NetworkManager.getImageData(with: result.image) { dataImage in
                                let characterModel = CharacterModel(id: result.id,
                                                                    name: result.name,
                                                                    status: result.status,
                                                                    species: result.species,
                                                                    type: result.type,
                                                                    gender: result.gender,
                                                                    placeOfBirth: result.origin.name,
                                                                    location: result.location.name,
                                                                    image: dataImage,
                                                                    episode: result.episode,
                                                                    created: result.created)
                                characters.append(characterModel)
                            }
                        }
                        
                        DispatchQueue.main.async {
                            completion(characters)
                        }

                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                }
            }
        }.resume()
    }

    static private func getImageData(with string: String, completion: @escaping (Data) -> Void) {
        guard let url = URL(string: string) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let response = response, (response as! HTTPURLResponse).statusCode == 200 else {
                    print((response as! HTTPURLResponse).statusCode.description)
                    return
                }
                if let data = data {
                    completion(data)
                }
            }
        }.resume()
    }
    
    static func getEpisodes(from string: String, completion: @escaping (String) -> Void) {
        guard let url = URL(string: string) else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print(error.localizedDescription)
            } else {
                guard let response = response, (response as! HTTPURLResponse).statusCode == 200 else {
                    print((response as! HTTPURLResponse).statusCode.description)
                    return
                }
                if let data = data {
                    do {
                        let jsonData = try JSONDecoder().decode(SingleEpisodeAPIResponse.self, from: data)
                        completion("Episode \(jsonData.id) - \(jsonData.name)")
                    } catch {
                        print("Error decoding JSON: \(error.localizedDescription)")
                    }
                }
            }
        }.resume()
    }
}
