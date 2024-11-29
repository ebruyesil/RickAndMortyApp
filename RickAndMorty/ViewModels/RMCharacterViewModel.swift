//
//  RMCharacterListViewModel.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 22.11.2024.
//

import Foundation

class RMCharacterViewModel: ObservableObject {
    @Published var characters: [RMCharacter] = []          // Tüm karakterler
    @Published var filteredCharacters: [RMCharacter] = []  // Filtrelenmiş karakterler
    @Published var selectedGender: String? = nil           // Seçilen cinsiyet filtresi
    @Published var selectedStatus: String? = nil           // Seçilen durum filtresi
    
    let rmrequest = RMRequest()
    
    func fetchCharacters(initialLoad: Bool = false) {
        // Eğer ilk yükleme ise tüm karakterleri çek
        if initialLoad {
            rmrequest.fetchCharacters { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let characters):
                        self?.characters = characters ?? []
                        self?.filteredCharacters = characters ?? []
                    case .failure(let error):
                        print("Error fetching characters: \(error)")
                    }
                }
            }
        } else {
            // Filtreleme ile API çağrısı
            rmrequest.fetchCharacters(gender: selectedGender, status: selectedStatus) { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let characters):
                        self?.filteredCharacters = characters ?? []
                    case .failure(let error):
                        print("Error fetching filtered characters: \(error)")
                    }
                }
            }
        }
    }
}



