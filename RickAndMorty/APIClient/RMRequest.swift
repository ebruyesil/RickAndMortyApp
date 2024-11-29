//
//  RMRequest.swift
//  RickAndMorty
//
//  Created by İrem Yeşil on 22.11.2024.
//

import Foundation

class RMRequest {
    
    @Published var characters : [RMCharacter] = []
    @Published var locations : [RMLocation] = []
    
    func fetchCharacters(gender: String? = nil, status: String? = nil, completion: @escaping
                         (Result<[RMCharacter]?, DownloaderError>) -> Void) {
        
        var urlString = "https://rickandmortyapi.com/api/character"
                var queryItems: [URLQueryItem] = []
                
                if let gender = gender {
                    queryItems.append(URLQueryItem(name: "gender", value: gender))
                }
                
                if let status = status {
                    queryItems.append(URLQueryItem(name: "status", value: status))
                }
                
                if !queryItems.isEmpty {
                    var components = URLComponents(string: urlString)!
                    components.queryItems = queryItems
                    urlString = components.string ?? urlString
                }
            
        guard let url = URL(string: urlString) else {
                    return completion(.failure(.wrongUrl))
                }
                
                URLSession.shared.dataTask(with: url) { data, response, error in
                    guard let data = data, error == nil else {
                        return completion(.failure(.dataNotReceived))
                    }
                    
                    guard let decodedData = try? JSONDecoder().decode(AllCharacters.self, from: data) else {
                        return completion(.failure(.dataCouldNotBeProcessed))
                    }
                    
                    completion(.success(decodedData.results))
                }.resume()
            }
    
    
  
    
    
    func fetchLocations(completion: @escaping
                         (Result<[RMLocation]?, DownloaderError>) -> Void) {
            guard let url = URL(string: "https://rickandmortyapi.com/api/location") else {
                return completion(.failure(.wrongUrl))
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data = data, error == nil else {
                    return completion(.failure(.dataNotReceived))
                }

                guard let decodedData = try? JSONDecoder().decode(AllLocations.self, from: data) else {
                    return completion(.failure(.dataCouldNotBeProcessed))
                }
                completion(.success(decodedData.results))
            }.resume()
        }
    
    func fetchEpisodes(completion: @escaping
                         (Result<[RMEpisode]?, DownloaderError>) -> Void) {
            guard let url = URL(string: "https://rickandmortyapi.com/api/episode") else {
                return completion(.failure(.wrongUrl))
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                guard let data = data, error == nil else {
                    return completion(.failure(.dataNotReceived))
                }

                guard let decodedData = try? JSONDecoder().decode(AllEpisodes.self, from: data) else {
                    return completion(.failure(.dataCouldNotBeProcessed))
                }
                completion(.success(decodedData.results))
            }.resume()
        }
    
}


enum DownloaderError: Error {
    case wrongUrl
    case dataNotReceived
    case dataCouldNotBeProcessed
}
