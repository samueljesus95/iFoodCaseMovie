//
//  HomeView.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 22/12/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView {
            PopularView()
                .tabItem {
                    Image(systemName: "lightbulb.max")
                    Text("Popular")
                }
            
            NowPlayingView()
                .tabItem {
                    Image(systemName: "play.fill")
                    Text("Now Playing")
                }
            
            UpcomingView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Upcomig")
                }
            
            TopRatedView()
                .tabItem {
                    Image(systemName: "star.fill")
                    Text("Top Rated")
                }
        }
    }
}

#Preview {
    HomeView()
}
