//
//  RMDeneme.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 22.11.2024.
//

import SwiftUI

struct RMDeneme: View {
    
    @StateObject private var viewModel = RMCharacterViewModel()
    var body: some View {
       
        NavigationView {
                    
                            List(viewModel.characters) { character in
                                NavigationLink(destination: RMCharacterDetailView(character: character)) {
                                    HStack {
                                        AsyncImage(url: URL(string: character.image)) { image in
                                            image
                                                .resizable()
                                                .scaledToFill()
                                        } placeholder: {
                                            ProgressView()
                                        }
                                        .frame(width: 80, height: 80)
                                        .clipShape(Circle())
                                        
                                        VStack(alignment: .leading) {
                                            Text(character.name)
                                                .font(.headline)
                                            Text("\(character.species) - \(character.status.rawValue)")
                                                .font(.subheadline)
                                                .foregroundColor(.secondary)
                                        }
                                    }
                                }

                    }
                    .navigationTitle("Rick and Morty")
                    .onAppear {
                        viewModel.fetchCharacters()
                    }
                }
    }
}

#Preview {
    RMDeneme()
}
