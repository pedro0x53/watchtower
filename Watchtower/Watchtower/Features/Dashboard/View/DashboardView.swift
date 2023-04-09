//
//  DashboardView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 08/04/23.
//

import SwiftUI

struct DashboardView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: [GridItem()], spacing: 16) {
                    ForEach(0..<10) { id in
                        AppCardView(name: "MyApp", level: .l1r, percent: Double(id))
                    }
                }
            }
            .scrollIndicators(.hidden)
            .padding(16)
            .navigationTitle("Apps")
            .toolbar {
                Button {
                    print("Create new App")
                } label: {
                    Image(systemName: "plus")
                }

            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .tint(.flame)
    }
}
