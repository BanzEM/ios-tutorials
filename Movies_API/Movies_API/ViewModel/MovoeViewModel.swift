//
//  MovoeViewModel.swift
//  Movies_API
//
//  Created by Bandisile Mazomba on 2026/09/01.
//

import Foundation
import Combine

class MovieViewModel: ObservableObject { //ObservableMacro
    
    @Published var movies = [Movie]()
    @Published var vmError: String?
    
    private let service = MovieDataService()
    
    //    func fetchMovie()
    //    {
    //        service.fetchMovies(completion: handleFetchMovies)
    //trailing closure
    
    //    }
    
    //    func handleFetchMovies(list:[Movie]?, error: Error?)
    //    {
    //        // I have a movie or an error
    //        guard error == nil else {
    //            vmError = error?.localizedDescription ?? "Failed to fetch movies"
    //            return
    //        }
    //
    //        guard let list = list else {
    //            vmError = error?.localizedDescription ?? "Failed to fetch movies, list Empty"
    //            return
    //        }
    //
    //        movies = list
    //
    //    }
    
    
    func fetchMovies(){
        //weak self -> if the view model is removed from memory also let go of this call
        service.fetchMovies { [weak self] movieList, error in
            
            DispatchQueue.main.async{
                
                guard error == nil else {
                    self?.vmError = error?.localizedDescription ?? "Failed to fetch movies"
                    return
                }
                
                guard let movieList else {
                    
                    self?.vmError = error?.localizedDescription ?? "Failed to fetch movies, list Empty"
                    return
                }
                
                self?.movies = movieList
                
            }
        }
    }
    
    
}
