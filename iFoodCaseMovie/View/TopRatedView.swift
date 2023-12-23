//
//  TopRatedView.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 22/12/23.
//

import SwiftUI

struct TopRatedView: View {
    
    @StateObject
    var topRatedViewModel = TopRatedViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(topRatedViewModel.topRatedItens, id: \.title) { cellItem in
                        Text(cellItem.title)
                            .padding()
                    }
                }
            }
            .onAppear() {
                topRatedViewModel.fetch()
            }
            .navigationTitle("Top Rated")
        }
    }
}

#Preview {
    TopRatedView()
}
