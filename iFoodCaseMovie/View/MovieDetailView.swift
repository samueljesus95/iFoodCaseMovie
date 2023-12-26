//
//  MovieDetailView.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 25/12/23.
//

import SwiftUI

struct MovieDetailView: View {
    
    @StateObject
    var movieDetailViewModel = MovieDetailViewModel()
    
    let movieId: Int
    
    var body: some View {
        VStack {
            Text(movieDetailViewModel.movieDetail?.title ?? "n/a")
        }
        .onAppear() {
            movieDetailViewModel.fetch(movieId)
        }
    }
}

#Preview {
    MovieDetailView(movieId: MovieStub.movieResult.id ?? 0)
}
