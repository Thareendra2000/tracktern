//
//  DataLoader.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import Foundation

class DataLoader {
    static func loadApplications() -> [Application] {
        guard let url = Bundle.main.url(forResource: "applications", withExtension: "json"),
              let data = try? Data(contentsOf: url) else {
            print("⚠️ Could not find or load applications.json")
            return []
        }

        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601

        do {
            let applications = try decoder.decode([Application].self, from: data)
            return applications
        } catch {
            print("❌ Failed to decode applications.json: \(error)")
            return []
        }
    }
}
