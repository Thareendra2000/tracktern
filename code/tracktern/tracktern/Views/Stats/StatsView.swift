//
//  StatsView.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import SwiftUI

struct StatsView: View {
    @EnvironmentObject var viewModel: ApplicationViewModel

    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 20) {
                Text("📊 Application Stats")
                    .font(.title2)
                    .padding(.bottom, 10)

                StatRow(title: "Total Applications", count: viewModel.applications.count)
                StatRow(title: "Applied", count: count(for: .applied))
                StatRow(title: "Interviews", count: count(for: .interview))
                StatRow(title: "Offers", count: count(for: .offer))
                StatRow(title: "Rejections", count: count(for: .rejected))

                Spacer()
            }
            .padding()
            .navigationTitle("Stats")
        }
    }

    private func count(for status: ApplicationStatus) -> Int {
        viewModel.applications.filter { $0.status == status }.count
    }
}

struct StatRow: View {
    let title: String
    let count: Int

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text("\(count)")
                .bold()
        }
        .padding(.vertical, 4)
    }
}
