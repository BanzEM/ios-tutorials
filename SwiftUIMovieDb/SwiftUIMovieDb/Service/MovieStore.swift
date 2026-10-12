//
//  MovieStore.swift
//  SwiftUIMovieDb
//
//  Created by Bandisile Mazomba on 2026/10/07.
//

import Foundation

class MovieStore: MovieService {
    
    static let shared = MovieStore()
    private init() {}
    
    private let apiKey = "ApiKiey"
    private let baseURL: String = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    
    private func loadURLAndDecode<T: Decodable>(url: URL, params: [String: String]? = nil , completion: @escaping (Result<T, MovieError>) -> ()){
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: "ApiKiey")]
        if let params = params {
            queryItems.append(contentsOf: params.map{URLQueryItem(name: $0.key, value: $0.value)})
        }
        urlComponents.queryItems = queryItems
        
     
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: finalURL){ (data, response, error) in
            
            
        }
        
        
        
    }
}
