//
//  ContentView.swift
//  Movies_API
//
//  Created by Bandisile Mazomba on 2026/09/01.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = MovieViewModel()
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear{
            viewModel.fetchMovies()
            
        }
    }
}

#Preview {
    ContentView()
}


//import SwiftUI
//
//struct ContentView: View {
//    
//    @StateObject var viewModel = MovieViewModel()
//    
//    var body: some View {
//        VStack{
//            NavigationStack{
//                List{
//                    ForEach(viewModel.movies){ movie in
//                        HStack{
//                            NavigationLink(destination: movieOverviewPage(movie:movie)){
//                                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")){
//                                    image in image
//                                        .resizable()
//                                        .aspectRatio(contentMode: .fit)
//                                        .frame(width: 120, height: 120)
//                                        .clipShape(Rectangle())
//                                    
//                                } placeholder: { //activity indicator
//                                    Rectangle()
//                                        .foregroundColor(.secondary)
//                                        .frame(width: 120, height: 120)
//                                    
//                                }
//                                
//                                VStack{
//                                    Text(movie.originalTitle)
//                                        .bold()
//                                    Spacer()
//                                    Text(movie.releaseDate)
//                                    //Text(movie.voteAverage)
//                                }
//                            }
//                            
//                        }
//                    }
//                }
//                .navigationTitle("Discover a movie")
//                .navigationBarTitleDisplayMode(.inline)
//            }
//            
//            
//        }
//    }
//}
//
//struct movieOverviewPage: View {
//    
//    //@StateObject var viewModel = MovieViewModel()
//    let movie: Movie
//    
//    var body: some View {
//        
//        VStack{
//            
//            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(movie.posterPath ?? "")")){
//                image in image
//                    .resizable()
//                    .aspectRatio(contentMode: .fit)
//                    .frame(width: 400, height: 400)
//                    .clipShape(Rectangle())
//                
//            } placeholder: {
//                Rectangle()
//                    .foregroundColor(.secondary)
//                    .frame(width: 300, height: 300)
//                
//            }
//            
//            Text("Overview")
//                .font(.largeTitle)
//                .bold()
//            
//            Text(movie.overview)
//        }
//    }
//}
//    
//    #Preview {
//        ContentView()
//    }
//
