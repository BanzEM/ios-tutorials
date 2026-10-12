//
//  Movie.swift
//  SwiftUIMovieDb
//
//  Created by Bandisile Mazomba on 2026/10/06.
//

import Foundation

struct MovieResponse: Decodable {
    
    let results: [Movie]
    
}

struct Movie: Decodable {
    
    let id: Int
    let originalTitle: String
    let overview: String
    let backdropPath: String?
    let posterPath: String?
    let releaseDate: String
    let voteAverage: Double
    let voteCount: Int
    let runtime: Int?
    
}
