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
        VStack(alignment: .leading, spacing: 4) {
            Text(application.companyName)
                .font(.headline)

            Text(application.jobTitle)
                .font(.subheadline)
                .foregroundColor(.secondary)

            Text(application.status.rawValue)
                .font(.caption)
                .padding(4)
                .background(statusColor)
                .foregroundColor(.white)
                .cornerRadius(6)
        }
        .padding(.vertical, 8)
    }

    private var statusColor: Color {
        switch application.status {
        case .applied: return .gray
        case .interview: return .orange
        case .offer: return .green
        case .rejected: return .red
        }
    }
}
