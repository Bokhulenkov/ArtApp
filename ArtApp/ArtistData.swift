//
//  ArtistData.swift
//  Art App
//
//  Created by Alexander on 16.09.2024.
//

import Foundation

struct ArtistData: Codable {
    static let baseURL = "https://cdn.accelonline.io/OUR6G_IgJkCvBg5qurB2Ag/files/YPHn3cnKEk2NutI6fHK04Q.json"
    let artists: [Artist]
    
}

struct Artist: Codable {
    
    let name: String
    let bio: String
    let image: String
    let works: [Work]
}

struct Work: Codable {
    let title: String
    let workImage: String
    let info: String
    
    // если добавили, то должны обязательно парсить все.
    enum CodingKeys: String, CodingKey {
        case title
        case workImage = "image"
        case info
    }
}



extension ArtistData {
    static func getMockArray() -> [Artist]{
        return [
            Artist(
                name: "Pablo Picasso",
                bio: "Pablo Ruiz y Picasso (25 October 1881 – 8 April 1973), also known as Pablo Picasso, was a Spanish painter, sculptor, printmaker, ceramicist, stage designer, poet and playwright who spent most of his adult life in France.",
                image: "0",
                works: [
                    Work(
                        title: "Guernica",
                        workImage: "Picasso1",
                        info: "Guernica is a mural-sized oil painting on canvas by Spanish artist Pablo Picasso completed by June 1937. The painting, which uses a palette of gray, black, and white, is regarded by many art critics as one of the most moving and powerful anti-war paintings in history. Standing at 3.49 metres (11 ft 5 in) tall and 7.76 metres (25 ft 6 in) wide, the large mural shows the suffering of people, animals, and buildings wrenched by violence and chaos."
                    )
                ]) ,
            Artist(
                name: "Vincent van Gogh",
                bio: "Vincent Willem van Gogh (30 March 1853 – 29 July 1890) was a Dutch post-Impressionist painter whose work had far-reaching influence on 20th-century art.",
                image: "1",
                works: [
                    Work(
                        title: "The Starry Night",
                        workImage: "VanGogh1",
                        info: "The Starry Night is an oil on canvas by the Dutch post-impressionist painter Vincent van Gogh. Painted in June 1889, it depicts the view from the east-facing window of his asylum room at Saint-Rémy-de-Provence, just before sunrise, with the addition of an idealized village. It has been in the permanent collection of the Museum of Modern Art in New York City since 1941, acquired through the Lillie P. Bliss Bequest. It is regarded as among Van Gogh's finest works, and is one of the most recognized paintings in the history of Western culture."
                    )
                ]
            ),     Artist(
                name: "Pablo Picasso",
                bio: "Pablo Ruiz y Picasso (25 October 1881 – 8 April 1973), also known as Pablo Picasso, was a Spanish painter, sculptor, printmaker, ceramicist, stage designer, poet and playwright who spent most of his adult life in France.",
                image: "2",
                works: [
                    Work(
                        title: "Guernica",
                        workImage: "Picasso1",
                        info: "Guernica is a mural-sized oil painting on canvas by Spanish artist Pablo Picasso completed by June 1937. The painting, which uses a palette of gray, black, and white, is regarded by many art critics as one of the most moving and powerful anti-war paintings in history. Standing at 3.49 metres (11 ft 5 in) tall and 7.76 metres (25 ft 6 in) wide, the large mural shows the suffering of people, animals, and buildings wrenched by violence and chaos."
                    )
                ]),
            Artist(name: "Petro", bio: "same artist", image: "4", works: [Work(title: "titya", workImage: "b", info: "gegemony v lesu")]),
            Artist(name: "Kyyd", bio: "japano mama", image: "3", works: [Work(title: "in garden", workImage: "f", info: "fifa")])
        ]
    }
}
