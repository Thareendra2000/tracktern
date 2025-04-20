//
//  HomeView.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var viewModel: ApplicationViewModel

    var body: some View {
        NavigationStack {
            List(viewModel.applications) { app in
                NavigationLink(destination: ApplicationDetailView(application: app)) {
                    ApplicationCardView(application: app)
                }
            }
            .navigationTitle("Applications")
        }
    }
}
