//
//  UpcomingView.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 22/12/23.
//

import SwiftUI

struct UpcomingView: View {
    
    @StateObject
    var upcomingViewModel = UpcomingViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    ForEach(upcomingViewModel.upcomingItens, id: \.title) { cellItem in
                        Text(cellItem.title)
                            .padding()
                    }
                }
            }
            .onAppear() {
                upcomingViewModel.fetch()
            }
            .navigationTitle("Upcoming")
        }
    }
}

#Preview {
    UpcomingView()
}
