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
    
    private let apiKey = "97733492071f7680771ede95aaed7a5e"
    private let baseURL: String = "https://api.themoviedb.org/3"
    private let urlSession = URLSession.shared
    private let jsonDecoder = Utils.jsonDecoder
    
    func fetchMovies(from endpoint: MovieListEndpoint, completion: @escaping (Result<MovieResponse, MovieError>) ->()){
        guard let url = URL(string: "\(baseURL)/movie/\(endpoint.rawValue)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, completion: completion)
    }
    
    func fetchMovie(id: Int, completion: @escaping (Result<Movie, MovieError>) -> ()) {
        guard let url = URL(string: "\(baseURL)/movie/\(id)") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, params: [
            "append_to_response": "videos, credits"
        ], completion: completion)
    }
    
    func searchMovie(for query: String, completion: @escaping (Result<MovieResponse, MovieError>) -> ()) {
        guard let url = URL(string: "\(baseURL)/search/movie") else {
            completion(.failure(.invalidEndpoint))
            return
        }
        self.loadURLAndDecode(url: url, params: [
            "language": "en-US",
            "include_adult": "false",
            "region": "ZA",
            "query": query
        ], completion: completion)
    }
    
    
    private func loadURLAndDecode<T: Decodable>(url: URL, params: [String: String]? = nil , completion: @escaping (Result<T, MovieError>) -> ()){
        
        guard var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false) else {
            
            completion(.failure(.invalidEndpoint))
            return
        }
        
        var queryItems = [URLQueryItem(name: "api_key", value: "\(apiKey)")]
        if let params = params {
            queryItems.append(contentsOf: params.map{URLQueryItem(name: $0.key, value: $0.value)})
        }
        urlComponents.queryItems = queryItems
        
     
        guard let finalURL = urlComponents.url else {
            completion(.failure(.invalidEndpoint))
            return
        }
        
        urlSession.dataTask(with: finalURL){ [weak self] (data, response, error) in
            guard let self = self else { return }
            if error != nil {
                self.executeCompletionHandlerInMainThreat(with: .failure(.apiError), completion: completion)
            }
            
            guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                
                self.executeCompletionHandlerInMainThreat(with: .failure(.invalidResponse), completion: completion)
                return
            }
            
            guard let data = data else {
                self.executeCompletionHandlerInMainThreat(with: .failure(.noData), completion: completion)
                return
            }
            
            do{
                let decodedData = try self.jsonDecoder.decode(T.self, from: data)
                self.executeCompletionHandlerInMainThreat(with: .success(decodedData), completion: completion)
            } catch {
                self.executeCompletionHandlerInMainThreat(with: .failure(.serializationError), completion: completion)
            }
        }.resume()
    }
    
    private func executeCompletionHandlerInMainThreat<T: Decodable>(with result: Result<T, MovieError>, completion: @escaping (Result<T,MovieError>) -> ()) {
        DispatchQueue.main.async {
            completion(result)
        }
        
    }
}
