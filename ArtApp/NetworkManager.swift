//
//  NetworkManager.swift
//  Art App
//
//  Created by Alexander Bokhulenkov on 17.09.2024.
//

import UIKit

struct NetworkManager {
    // MARK: - Variables
    
    private let url = ArtistData.baseURL
    private let sessionConfiguration = URLSessionConfiguration.default
    private let decoded = JSONDecoder()
    
    // MARK: - <#Section Heading#>
    
    func fetchData() {
        
        let session = URLSession(configuration: sessionConfiguration)
        
        guard let url = URL(string: url) else { return }
        //        UIApplication.shared.canOpenURL(url) можно проверить url на вилидность так
        
        let urlRequest = URLRequest(url: url)
        
        session.dataTask(with: urlRequest) { data, response, error in
            
            if error == nil, let parsData = data {
                
                
            } else {
                print("Error: \(String(describing: error?.localizedDescription))")
            }
            
        }.resume()
    }
        
    
    func parseJSON(_ data: Data) -> Artist? {
            
        do { let decoderData = try decoded.decode(Artist.self, from: data)
            
            let nameArtist = decoderData.name
            let bioArtist = decoderData.bio
            let imageArtist = decoderData.image
            let works = decoderData.works
            
            let artistData = Artist(name: nameArtist, bio: bioArtist, image: imageArtist, works: works)
            
            return artistData
        } catch {
            print("Error")
        }
        return nil
                
                
                
        }
        
}
