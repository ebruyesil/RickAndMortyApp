//
//  RMEpisodeViewModel.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 27.11.2024.
//

import Foundation

class RMEpisodeViewModel : ObservableObject {
    @Published var episodes : [RMEpisode] = []
    let rmRequest = RMRequest()
    
    func fetchEpisodes() {
        rmRequest.fetchEpisodes() { (result) in
            DispatchQueue.main.async {
                switch result {
                case .success(let episodes):
                    self.episodes = episodes ?? []
                case .failure(let error):
                    print(error)
                }
                
            }
        }
    }
}
