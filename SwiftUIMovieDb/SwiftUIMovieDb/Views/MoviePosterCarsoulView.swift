//
//  MoviePosterCarsoulView.swift
//  SwiftUIMovieDb
//
//  Created by Bandisile Mazomba on 2026/10/13.
//

import SwiftUI

struct MoviePosterCarsoulView: View {
    let title: String
    let movies: [Movie]
    
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.horizontal)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 16) {
                    ForEach(self.movies) { movie in
                       MoviePosterCard(movie: movie)
                            .padding(.leading, movie.id == self.movies.first!.id ? 16 : 0)
                            .padding(.trailing, movie.id == self.movies.last!.id ? 16 : 0)
                        }
                    }
                }
            }
            
        }
}

struct MoviePosterCarsoulView_Previews: PreviewProvider {
    static var previews: some View {
        MoviePosterCarsoulView(title: "Now Playing", movies: Movie.stubbedMovies)
    }
}
