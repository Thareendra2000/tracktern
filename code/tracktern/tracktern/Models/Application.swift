//
//  Application.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import Foundation

enum ApplicationStatus: String, CaseIterable, Codable, Identifiable {
    case applied = "Applied"
    case interview = "Interview Scheduled"
    case offer = "Offer Received"
    case rejected = "Rejected"

    var id: String { self.rawValue }
}

struct Application: Identifiable, Codable {
    var id: String
    var companyName: String
    var jobTitle: String
    var dateApplied: Date
    var status: ApplicationStatus
    var notes: String
    var interviewDate: Date?
}

