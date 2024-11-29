//
//  RMEpisodeListView.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 21.11.2024.
//

import SwiftUI

struct RMEpisodeListView: View {
    
    @StateObject var viewModel = RMEpisodeViewModel()
    
    var body: some View {
        ZStack {
  
            VStack {
                Text("All Episodes")
                    .font(.largeTitle)
                    .bold().italic()
                
                ScrollView{
                    VStack (spacing: 15){
                        ForEach(viewModel.episodes) { episode in
                            VStack (alignment: .leading, spacing: 10){
                                Text("Name: \(episode.name)")
                                    .font(.headline)
                                
                                Text("Episode: \(episode.episode)")
                                    .font(.subheadline)
                                
                                Text("Date: \(episode.air_date)")
                                    .font(.footnote)
                                
                            }.padding()
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color.title.opacity(0.5))
                                .cornerRadius(15)
                        }
                    }
                  }.onAppear {
                    viewModel.fetchEpisodes()
                }
            }
        }
    }
}

#Preview {
    RMEpisodeListView()
}
