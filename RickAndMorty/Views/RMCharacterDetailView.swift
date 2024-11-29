//
//  RMCharacterDetailView.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 22.11.2024.
//

import SwiftUI

struct RMCharacterDetailView: View {
    
    let character : RMCharacter
    
    let columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    var body: some View {
        NavigationView{
                ZStack {
                
                    VStack {
                        Text(character.name)
                            .font(.largeTitle)
                            .italic()
                        ScrollView{
                            ZStack(alignment: .bottomTrailing) {
                                RMSpecialImageView(url: character.image)
                                    .frame(width: UIScreen.main.bounds.width * 0.9, height: UIScreen.main.bounds.height * 0.35)
                                    .aspectRatio(contentMode: .fit)
                                    .overlay(Rectangle()
                                        .stroke(
                                            character.status.rawValue == "Alive" ? .green :
                                                character.status.rawValue == "Dead" ? .red :
                                                    .black,
                                            lineWidth: 5))
                                
                                Text("Status : \(character.status.rawValue)")
                                    .frame(height: 1)
                                    .padding()
                                    .foregroundColor(.white)
                                    .background(character.status.rawValue == "Alive" ? .green :
                                                    character.status.rawValue == "Dead" ? .red :
                                            .black)
                            }.padding(.bottom, 20)
                            
                            HStack{
                                Text("PROPERTIES")
                                    .foregroundColor(.black)
                                    .bold()
                                
                            }
                           
                            HStack {
                                Text("Gender")
                                    .frame(width: 100)
                                    .padding()
                                    .background(Rectangle().stroke(.black, lineWidth: 1))
                                
                                
                                Text(character.gender.rawValue == "" ? "unknown":
                                        character.gender.rawValue)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blueLine.opacity(0.4))
                                .background(Rectangle().stroke(.black, lineWidth: 1))
                                
                                
                            }.padding(.horizontal)
                            
                            HStack {
                                Text("Species")
                                    .frame(width: 100)
                                    .padding()
                                    .background(Color.title.opacity(0.4))
                                    .background(Rectangle().stroke(.black, lineWidth: 1))
                                
                                Text(character.species == "" ? "unknown":
                                        character.species)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Rectangle().stroke(.black, lineWidth: 1))
                            }.padding(.horizontal)
                            
                            HStack{
                                Text("WHERE ABOUTS")
                                    .foregroundColor(.black)
                                    .bold()
                                    .padding()
                           
                            }
                  
                            HStack {
                                Text("Origin")
                                    .frame(width: 100)
                                    .padding()
                                    .background(Rectangle().stroke(.black, lineWidth: 1))
                                
                                Text(character.origin.name == "" ? "unknown":
                                        character.origin.name)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.adınıDeistir.opacity(0.4))
                                .background(Rectangle().stroke(.black, lineWidth: 1))
                            }.padding(.horizontal)
                            
                            HStack {
                                Text("Location")
                                    .frame(width: 100)
                                    .padding()
                                    .background(Color.title.opacity(0.4))
                                    .background(Rectangle().stroke(.black, lineWidth: 1))
                                
                                Text(character.location.name == "" ? "unknown":
                                        character.location.name)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Rectangle().stroke(.black, lineWidth: 1))
                            }.padding(.horizontal)
                            
                            HStack {
                                Text("Created At")
                                    .frame(width: 100)
                                    .padding()
                                    .background(Rectangle().stroke(.black, lineWidth: 1))
                                
                                Text(character.created == "" ? "unknown":
                                        character.created)
                                .frame(maxWidth: .infinity)
                                .padding()
                                .background(Color.blueLine.opacity(0.4))
                                .background(Rectangle().stroke(.black, lineWidth: 1))
                            }.padding(.horizontal)
                        }
                    }
                }
            }
        }
    }
//.background(Color.adınıDeistir.opacity(0.4))
#Preview {
    RMCharacterDetailView(character: characterOne)
}
