//
//  Movie+Stub.swift
//  SwiftUIMovieDb
//
//  Created by Bandisile Mazomba on 2026/10/13.
//

import Foundation

extension Movie {
    
    static var stubbedMovies: [Movie] {
        let response: MovieResponse? = try? Bundle.main.loadAndDecodeJson(fileName: "movie_list")
        return response!.results
    }
    
    static var stubbedMovie: Movie {
        stubbedMovies[0]
    }
}

extension Bundle {
    func loadAndDecodeJson<T: Decodable>(fileName: String) throws -> T? {
        
        guard let url = self.url(forResource: fileName, withExtension: "json") else {
            return nil
        }
         let data = try Data(contentsOf: url)
        let jsonDecoder = Utils.jsonDecoder
        let decodedModel = try jsonDecoder.decode(T.self, from: data)
        return decodedModel
    }
}
