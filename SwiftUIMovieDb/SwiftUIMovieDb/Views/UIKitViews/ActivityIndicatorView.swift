//
//  ActivityIndicatorView.swift
//  SwiftUIMovieDb
//
//  Created by Bandisile Mazomba on 2026/10/13.
//
import SwiftUI

 struct ActivityIndicatorView: UIViewRepresentable {
    
    func updateUIView(_ uiView: UIViewType, context: Context) {}
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        let view = UIActivityIndicatorView(style: .large)
        view.startAnimating()
        return view
    }
}
