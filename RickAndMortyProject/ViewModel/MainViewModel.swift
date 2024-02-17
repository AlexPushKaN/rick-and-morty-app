//
//  MainViewModel.swift
//  RickAndMortyProject
//
//  Created by Александр Муклинов on 16.02.2024.
//

import Foundation

class MainViewModel {
    
    var characters: Binding<[CharacterModel]> = Binding([])
    
    func loadCharacters(from urlString: String) {
        
        let backgroundQueue = DispatchQueue.global(qos: .userInitiated)
        backgroundQueue.async {
            NetworkManager.getInfo(from: urlString) { characters in

                var updatedCharacters: [CharacterModel] = []
                let group = DispatchGroup()
                
                for character in characters {

                    group.enter()
                    
                    var updatedCharacter: CharacterModel = character
                    var episodes: [String] = []
                    
                    for urlEpisode in character.episode {
                        NetworkManager.getEpisodes(from: urlEpisode) { episodeData in
                            episodes.append(episodeData)
                            
                            if episodes.count == character.episode.count {
                                updatedCharacter.episode = episodes
                                updatedCharacters.append(updatedCharacter)
                                
                                group.leave()
                                
                            }
                        }
                    }
                }
                group.notify(queue: .main) {
                    self.characters.value = updatedCharacters
                }
            }
        }
    }
}
