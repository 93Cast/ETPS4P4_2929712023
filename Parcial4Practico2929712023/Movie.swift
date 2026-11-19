//
//  Movie.swift
//  Parcial4Practico2929712023
//
//  Created by DanielSosa on 18/11/26.
//
import Foundation
import SwiftUI

struct Movie: Identifiable, Codable {
    let id: Int
    let title: String
    let year: Int
    let genre: String
    let description: String
    let posterImage: String
    let star: Int
}

enum MovieLoader {
    static func loadMovies() -> [Movie] {
        guard let url = Bundle.main.url(forResource: "movies", withExtension: "json") else {
            print("No se encontró movies.json en el Bundle")
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            return try JSONDecoder().decode([Movie].self, from: data)
        } catch {
            print("Error al decodificar movies.json: \(error)")
            return []
        }
    }
}
