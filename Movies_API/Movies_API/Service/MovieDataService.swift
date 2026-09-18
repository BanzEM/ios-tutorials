//
//  MovieDataService.swift
//  Movies_API
//
//  Created by Bandisile Mazomba on 2026/09/01.
//

import Foundation
//func passDataBack( list:[Movie]?, error: Error?){
//
//}


class MovieDataService {
    let urlString = "https://api.themoviedb.org/3/discover/movie?api_key=97733492071f7680771ede95aaed7a5e"
    
    func fetchMovies(completion: @escaping ([Movie]?, Error?) -> Void) {
        
        guard let url = URL(string: urlString) else {
            completion(nil,NSError(domain: "INVALID URL", code: 0, userInfo: nil))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                completion(nil , error)
                return
            }
            
            guard let data = data else {
                completion(nil, error)
                return
            }
            
            
            do
            {
                self.prettyPrintJSON(data)
                let decoder = JSONDecoder()
                let results: MovieResponse = try decoder.decode(MovieResponse.self, from: data)
                
                completion(results.results, nil)
                
                
            } catch {
                completion(nil, error)
            }
        }
        
        task.resume()
 }
    
    func prettyPrintJSON(_ data: Data) {
        do {
            let object = try JSONSerialization.jsonObject(with: data)
            let prettyData = try JSONSerialization.data(
                withJSONObject: object,
                options: [.prettyPrinted, .sortedKeys]
            )

            print(String(data: prettyData, encoding: .utf8) ?? "")
        } catch {
            print("Invalid JSON:", error)
        }
    }
    
    
}

