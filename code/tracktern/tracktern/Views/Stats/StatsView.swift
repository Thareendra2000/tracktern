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
            VStack(alignment: .leading, spacing: 16) {

                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible())], spacing: 16) {
                    StatCard(title: "Total Applications", icon: "doc.text", count: viewModel.applications.count, bgColor: Color.orange.opacity(0.1))
                    StatCard(title: "Interview scheduled", icon: "video", count: count(for: .interview), bgColor: Color.gray.opacity(0.1))
                    StatCard(title: "Offered", icon: "checkmark.circle", count: count(for: .offer), bgColor: Color.green.opacity(0.1))
                    StatCard(title: "Rejected", icon: "xmark.circle", count: count(for: .rejected), bgColor: Color.red.opacity(0.1))
                }
                .padding(.horizontal)
                .padding(.top, 4)

                Spacer()
            }
            .padding(.top)
            .navigationTitle("Stats")
        }
    }

    private func count(for status: ApplicationStatus) -> Int {
        viewModel.applications.filter { $0.status == status }.count
    }
}

struct StatCard: View {
    let title: String
    let icon: String
    let count: Int
    let bgColor: Color

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Image(systemName: icon)
                .font(.title2)
                .foregroundColor(.primary)

            Text(title)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.primary)

            Text("\(count)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.black)
        }
        .padding()
        .frame(maxWidth: .infinity, minHeight: 120, alignment: .leading)
        .background(bgColor)
        .cornerRadius(16)
    }
}
