//
//  NetworkManager.swift
//  Art App
//
//  Created by Alexander Bokhulenkov on 17.09.2024.
//

import Foundation

struct NetworkManager {
    
    private let url = ArtistData.baseURL
    
    
    
    
     func performRequest() async {
        
        guard let url = URL(string: url) else { fatalError("Failed get url") }
        
        let urlRequest = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: urlRequest) {data, response, error in
            guard let safeData = data else { return }
            guard let artistData = parseJSON(safeData) else { return }
        }
        task.resume()
    }
    
    

    
    func parseJSON(_ data: Data) -> Artist? {
        let decoder = JSONDecoder()
        
        do {
            let decoderData = try decoder.decode(Artist.self, from: data)
            let nameArtist = decoderData.name
            let bioArtist = decoderData.bio
            let imageArtist = decoderData.image
            let works = decoderData.works
            
            let artistData = Artist(name: nameArtist, bio: bioArtist, image: imageArtist, works: works)
            return artistData
        } catch {
            print(fatalError("json error"))
            return nil
        }
    }
 
}
