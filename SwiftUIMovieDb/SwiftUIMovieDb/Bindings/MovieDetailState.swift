//
//  MovieDetailState.swift
//  SwiftUIMovieDb
//
//  Created by Bandisile Mazomba on 2026/10/15.
//

import SwiftUI
import Combine


class MovieDetailState: ObservableObject {
    
    private let movieService: MovieService
    @Published var movie: Movie?
    @Published var isLoading: Bool = false
    @Published var error: NSError?
    
    init(movieService: MovieService = MovieStore.shared) {
        self.movieService = movieService
    }
    
    func loadMovie(id: Int) {
        self.movie = nil
        self.isLoading = false
        self.movieService.fetchMovie(id: id) { [weak self] result in
            guard let self else { return }
            
            self.isLoading = false
            switch result {
            case .success(let movie):
                self.movie = movie
            case .failure(let error):
                self.error = error as NSError
            }
        }
    }
}

