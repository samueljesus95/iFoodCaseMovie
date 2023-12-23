//
//  NowPlayingView.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 22/12/23.
//

import SwiftUI

struct NowPlayingView: View {
    
    @StateObject
    var nowPlayingViewModel = NowPlayingViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(nowPlayingViewModel.nowPlayingItens, id: \.title) { cellItem in
                        Text(cellItem.title)
                            .padding()
                    }
                }
            }
            .onAppear() {
                nowPlayingViewModel.fetch()
            }
            .navigationTitle("Now Playing")
        }
    }
}

#Preview {
    NowPlayingView()
}
