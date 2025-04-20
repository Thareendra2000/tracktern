//
//  ApplicationCardView.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import SwiftUI

struct ApplicationCardView: View {
    let application: Application

    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            VStack(alignment: .leading, spacing: 6) {
                Text(application.jobTitle)
                    .font(.headline)
                    .foregroundColor(.primary)

                Text(application.companyName)
                    .font(.subheadline)
                    .foregroundColor(.secondary)

                Text(application.status.rawValue.capitalized)
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(statusColor)
                    .foregroundColor(.black)
                    .cornerRadius(6)
            }

            Spacer()

            Text(timeAgoString(from: application.dateApplied))
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
        .shadow(color: .gray.opacity(0.5), radius: 4, x: 0, y: 2)
        .padding(.horizontal)
        .padding(.bottom, 4)
    }

    private var statusColor: Color {
        switch application.status {
        case .applied: return Color.green.opacity(0.3)
        case .interview: return Color.cyan.opacity(0.3)
        case .offer: return Color.yellow.opacity(0.4)
        case .rejected: return Color.red.opacity(0.3)
        }
    }

    private func timeAgoString(from date: Date) -> String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .short
        return formatter.localizedString(for: date, relativeTo: Date())
    }
}

