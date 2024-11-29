//
//  deneme.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 28.11.2024.
//

import SwiftUI



struct FilterSheet: View {
    @Binding var selectedStatus: String?
    @Binding var selectedGender: String?
    let onApply: () -> Void
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Status")) {
                    Picker("Status", selection: $selectedStatus) {
                        Text("All").tag(nil as String?)
                        Text("Alive").tag("Alive" as String?)
                        Text("Dead").tag("Dead" as String?)
                        Text("Unknown").tag("unknown" as String?)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                Section(header: Text("Gender")) {
                    Picker("Gender", selection: $selectedGender) {
                        Text("All").tag(nil as String?)
                        Text("Male").tag("Male" as String?)
                        Text("Female").tag("Female" as String?)
                        Text("Unknown").tag("unknown" as String?)
                    }
                    .pickerStyle(MenuPickerStyle())
                }
            }
            .navigationTitle("Filter Characters")
            .toolbar {
                ToolbarItem(placement: .confirmationAction) {
                    Button("Apply") {
                        onApply()
                    }
                }
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") {
                        onApply()
                    }
                }
            }
        }
    }
}

