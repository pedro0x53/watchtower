//
//  DashboardView.swift
//  Watchtower
//
//  Created by Pedro Sousa on 08/04/23.
//

import SwiftUI

struct DashboardView: View {

    @State private var isCreatingNewApp: Bool = false

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
                    isCreatingNewApp = true
                } label: {
                    Image(systemName: "plus")
                }

            }
            .ignoresSafeArea(.all, edges: .bottom)
        }
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $isCreatingNewApp, content: {
            NewAppView()
        })
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .tint(.flame)
    }
}
