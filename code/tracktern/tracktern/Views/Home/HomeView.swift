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
            VStack(alignment: .leading, spacing: 16) {
                // Header with Profile Image and Name
                HStack(spacing: 12) {
                    Image(systemName: "person.circle")
                        .resizable()
                        .frame(width: 48, height: 48)
                        .foregroundColor(.gray)

                    VStack(alignment: .leading) {
                        Text("Hello,")
                            .font(.subheadline)
                            .foregroundColor(.secondary)

                        Text("John Doe") // You can replace this with a dynamic value if needed
                            .font(.title2)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.horizontal)

                ScrollView {
                    VStack(alignment: .leading) {
                        ForEach(viewModel.applications) { app in
                            NavigationLink(destination: ApplicationDetailView(application: app)) {
                                ApplicationCardView(application: app)
                            }
                            .buttonStyle(PlainButtonStyle())
                        }
                    }
                    .padding(.horizontal)
                    .padding(.top, 8)
                }
            }
        }
    }
}

