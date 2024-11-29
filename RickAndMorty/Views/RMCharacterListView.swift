//
//  RMCharacterListView.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 21.11.2024.
//

import SwiftUI

struct RMCharacterListView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @StateObject var viewModel = RMCharacterViewModel()
    
    @State private var isFilterSheetVisible = false
        @State private var selectedGender: String? = nil
        @State private var selectedStatus: String? = nil
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView {
                    ScrollView {
                        // Dark Mode ve Light Mode'a göre renk değişimi
                                            Color(isDarkMode ? "backgroundColorDark" : "backgroundColorLight")
                                                .edgesIgnoringSafeArea(.all)  // Ekranın her yerini kapla
                                            
                            VStack {
                        Image("background")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .overlay(Rectangle()
                                                .fill(Color.blueLine)
                                                .frame(height: 10),
                                            alignment: .bottom)
                            .frame(width: UIScreen.main.bounds.width * 1, height: UIScreen.main.bounds.height * 0.4)
                        HStack {
                            Text("All Characters")
                                .font(.largeTitle)
                                .bold().italic()
                            
                            
                            Button(action: {
                                                isFilterSheetVisible.toggle()
                                            }) {
                                                HStack {
                                                                        Image(systemName: "slider.horizontal.3")
                                                                        Text("Filter")
                                                                    }
                                                                    .font(.headline)
                                                                    .foregroundColor(.white)
                                                                    .padding()
                                                                    .background(Color.blueLine)
                                            }
                                            .sheet(isPresented: $isFilterSheetVisible) {
                                                RMFilterView(
                                                    selectedGender: $viewModel.selectedGender,
                                                    selectedStatus: $viewModel.selectedStatus,
                                                    applyFilters: {
                                                        viewModel.fetchCharacters(initialLoad: false) // Filtreleme yap
                                                        isFilterSheetVisible = false
                                                    }
                                                )
                                            }
                                            .padding()
                        }
          
                        
                        LazyVGrid(columns: columns, spacing: 15) {
                            ForEach(viewModel.filteredCharacters) { character in
                                NavigationLink(destination: RMCharacterDetailView(character: character)) {
                                    VStack() {
                                        RMSpecialImageView(url: character.image)
                                            .frame(width: UIScreen.main.bounds.width * 0.4, height: UIScreen.main.bounds.height * 0.23)
                                            .padding([.top, .leading, .trailing], 16)
                                        
                                        Text(character.name)
                                            .font(.headline)
                                            .multilineTextAlignment(.leading)
                                            .padding([.bottom], 20)
                                            .padding([.top], 8)
                                        
                                      
                                    }
                                    
                                    .background(Rectangle().stroke(Color.blueLine, lineWidth: 2))
                                }
                            }
                        }
                    }
                    .onAppear {
                        if viewModel.characters.isEmpty {
                                            viewModel.fetchCharacters(initialLoad: true) // İlk yükleme
                        }
                    }
                        
            }.navigationTitle("Home Page")
                .navigationBarTitleDisplayMode(.inline)
               .navigationBarHidden(true)
             
            
        }.tint(.black)
    }
}

#Preview {
    RMCharacterListView()
}
