//
//  RMLocationViewModel.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 26.11.2024.
//

import Foundation

class RMLocationViewModel : ObservableObject {
    @Published var locations : [RMLocation] = []
    let rmRequest = RMRequest()
    
    func fetchLocations() {
        rmRequest.fetchLocations() { (result) in
            DispatchQueue.main.async{
                switch result {
                case .success(let locations):
                    self.locations = locations ?? []
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
    
}
