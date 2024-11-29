//
//  RMSettingListView.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 21.11.2024.
//

import SwiftUI

struct RMSettingListView: View {
    @AppStorage("isDarkMode") private var isDarkMode = false 
        @State private var selectedLanguage = "English"
        @State private var notificationEnabled = true
        
        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("General Settings")) {
                        Toggle("Dark Mode", isOn: $isDarkMode)  // Dark mode toggles
                        Picker("Language", selection: $selectedLanguage) {
                            Text("English").tag("English")
                            Text("Türkçe").tag("Türkçe")
                            Text("Español").tag("Español")
                        }
                    }
                    
                    Section(header: Text("Notifications")) {
                        Toggle("Enable Notifications", isOn: $notificationEnabled)
                    }
                    
                    Section(header: Text("About")) {
                        HStack {
                            Text("App Version")
                            Spacer()
                            Text("1.0.0")
                                .foregroundColor(.gray)
                        }
                        HStack {
                            Text("API Source")
                            Spacer()
                            Link("Rick and Morty API", destination: URL(string: "https://rickandmortyapi.com")!)
                        }
                    }
                }
                .navigationTitle("Settings")
            }
        }
}

#Preview {
    RMSettingListView()
}
