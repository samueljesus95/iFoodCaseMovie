//
//  PopularView.swift
//  iFoodCaseMovie
//
//  Created by Samuel on 21/12/23.
//

import SwiftUI

struct PopularView: View {
    
    @StateObject
    var popularViewModel = PopularViewModel()
    
    var body: some View {
        VStack {
            Text("Popular")
                .padding()
            Spacer()
            List {
                ForEach(popularViewModel.popularItens, id: \.title) { cellItem in
                    Text(cellItem.title)
                        .padding()
                }
            }
        }
        .onAppear() {
            popularViewModel.fetch()
        }
    }
}

#Preview {
    PopularView()
}
