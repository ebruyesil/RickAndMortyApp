//
//  RMFilterView.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 27.11.2024.
//

import SwiftUI

struct RMFilterView: View {
    @Binding var selectedGender: String?
        @Binding var selectedStatus: String?
        var applyFilters: () -> Void
        
        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("Gender")) {
                        Picker("Select Gender", selection: $selectedGender) {
                            Text("All").tag(nil as String?)
                            Text("Male").tag("male" as String?)
                            Text("Female").tag("female" as String?)
                            Text("Unknown").tag("unknown" as String?)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Section(header: Text("Status")) {
                        Picker("Select Status", selection: $selectedStatus) {
                            Text("All").tag(nil as String?)
                            Text("Alive").tag("alive" as String?)
                            Text("Dead").tag("dead" as String?)
                            Text("Unknown").tag("unknown" as String?)
                        }
                        .pickerStyle(SegmentedPickerStyle())
                    }
                    
                    Button(action: {
                        applyFilters()
                    }) {
                        Text("Apply Filters")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blueLine)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical)
                }
                .navigationTitle("Filter Characters")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
}

