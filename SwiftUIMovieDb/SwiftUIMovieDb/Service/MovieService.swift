//
//  MovieService.swift
//  SwiftUIMovieDb
//
//  Created by Bandisile Mazomba on 2026/10/07.
//

import Foundation

protocol MovieService {
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<[MovieResponse], MovieError>) -> ())
    func fetchMovieDetails(for movieId: Int, completion: @escaping (Result<Movie, MovieError>) -> ())
    func searchMovie(for query: String, completion: @escaping (Result<[MovieResponse], MovieError>) -> ())
    
}

enum MovieListEndpoint: String, CaseIterable {
    
    case nowPlaying = "now_playing"
    case popular = "popular"
    case topRated = "top_rated"
    case upcoming = "upcoming"
    
    var description: String {
        switch self {
            case .nowPlaying:
            return "now_playing"
        case .popular:
            return "popular"
        case .topRated:
            return "top_rated"
        case .upcoming:
            return "upcoming"
        }
    }
    
}

enum MovieError: Error, CustomNSError {
    
    case apiError
    case noData
    case invalidResponse
    case invalidEndpoint
    case serializationError
    
    var errorDescription: String? {
        switch self {
        case .apiError:
            return "There was an error with the API."
        case .noData:
            return "No data was returned from the API."
        case .invalidResponse:
            return "The API returned an invalid response."
        case .invalidEndpoint:
            return "The endpoint provided was invalid."
        case .serializationError:
            return "There was an error parsing the data returned from the API."
        }
        
    }
    
    var errorUserInfo: [String : Any] {
        return [NSLocalizedDescriptionKey: errorDescription ?? "An unknown error occurred."]
    }
    
}
