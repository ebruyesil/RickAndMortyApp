//
//  RMAllCharactersViewModel.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 22.11.2024.
//

import Foundation

class RMAllCharactersViewModel : ObservableObject {
    
    @Published var characters: [RMCharacter] = []
    let rmrequest = RMRequest()
    
    func fetchCharacters() {
        rmrequest.fetchCharacters() {(result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let characters):
                    self.characters = characters ?? []
                case .failure(let error):
                    print(error)
                
            }
        }
      }
    }
}


