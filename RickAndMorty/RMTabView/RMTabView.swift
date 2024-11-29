//
//  ContentView.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 21.11.2024.
//

import SwiftUI

struct RMTabView: View {
    
    @State private var selectedIndex = Tabs.character
    
    
    var body: some View {
        VStack {
            TabView(selection: $selectedIndex) {
                RMCharacterListView().tabItem {
                    Image(systemName: "person")
                    Text("Characters")
                }.tag(Tabs.character)
                
                RMLocationListView().tabItem {
                    Image(systemName: "globe")
                    Text("Locations")
                }.tag(Tabs.location)
                
                RMEpisodeListView().tabItem {
                    Image(systemName: "tv")
                    Text("Episodes")
                }.tag(Tabs.episode)
                
                RMSettingListView().tabItem {
                    Image(systemName: "gear")
                    Text("Settings")
                }.tag(Tabs.setting)
                
            }.tint(.black)
        }
    }
}

#Preview {
    RMTabView()
}
