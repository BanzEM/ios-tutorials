//
//  Movie.swift
//  Movies_API
//
//  Created by Bandisile Mazomba on 2026/09/01.

import Foundation

struct MovieResponse: Codable {
    let results: [Movie]
}

struct Movie: Codable, Identifiable {
    var id: Int
    var original_title: String
    var overview: String
    var release_date: String?
    var vote_average: Double
    var poster_path: String?
}
