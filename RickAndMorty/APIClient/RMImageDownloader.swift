//
//  RMImageDownloader.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 22.11.2024.
//

import Foundation

class RMImageDownloader : ObservableObject {
    @Published var indirilenGorsel : Data?
    
    func gorselIndir(url : String) {
        
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, response, error) in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async{
                self.indirilenGorsel = data
            }
            
        }.resume()
    }
}
