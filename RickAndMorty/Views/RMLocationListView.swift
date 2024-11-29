//
//  RMLocationListView.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 21.11.2024.
//

import SwiftUI

struct RMLocationListView: View {
    
    @StateObject var viewModel = RMLocationViewModel()
    
    var body: some View {
        ZStack {
            VStack {
                Text("All Locations")
                    .font(.largeTitle)
                    .bold().italic()
                        
                ScrollView {
                    VStack(spacing: 15) {
                        ForEach(viewModel.locations) { location in
                            VStack(alignment: .leading, spacing: 10) {
                                Text("Name: \(location.name)")
                                    .font(.headline)
                                
                                Text("Dimension: \(location.dimension)")
                                    .font(.subheadline)
                                
                                Text("Created: \(location.created)")
                                    .font(.footnote)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.adınıDeistir.opacity(0.5))
                            .cornerRadius(15)
                        }
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchLocations()
        }
    }
}

#Preview {
    RMLocationListView()
}
