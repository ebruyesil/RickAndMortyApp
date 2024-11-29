//
//  RMSpecialImageView.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 22.11.2024.
//

import SwiftUI

struct RMSpecialImageView: View {
    
    let url : String
    @ObservedObject var imageDownloaderClient = RMImageDownloader()
    
    init(url : String) {
        self.url = url
        self.imageDownloaderClient.gorselIndir(url: self.url)
    }
    
    
    var body: some View {
        if let data = self.imageDownloaderClient.indirilenGorsel {
            return Image(uiImage: UIImage(data: data)!)
                .resizable()
        } else {
            //buraya placeholder image yüklenmediyse ne görünsün istersen onu koy
            return Image("loading")
                .resizable()
        }
    }
    
}

#Preview {
    RMSpecialImageView(url: "https://rickandmortyapi.com/api/character/avatar/25.jpeg")
}
