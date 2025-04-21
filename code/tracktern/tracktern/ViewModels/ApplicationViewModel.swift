//
//  ApplicationViewModel.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import Foundation

class ApplicationViewModel: ObservableObject {
    @Published var applications: [Application] = [] {
        didSet {
            saveApplications()
        }
    }

    private let storageKey = "SavedApplications"

    init() {
        loadApplications()
    }

    func loadApplications() {
        if let data = UserDefaults.standard.data(forKey: storageKey) {
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            if let savedApps = try? decoder.decode([Application].self, from: data) {
                self.applications = savedApps
                return
            }
        }

        // If no data is found, fall back to JSON for initial load
        self.applications = DataLoader.loadApplications()
        saveApplications()
    }

    func saveApplications() {
        let encoder = JSONEncoder()
        encoder.dateEncodingStrategy = .iso8601
        if let encoded = try? encoder.encode(applications) {
            UserDefaults.standard.set(encoded, forKey: storageKey)
        }
    }

    func addApplication(_ application: Application) {
        applications.append(application)
    }

    func updateApplication(_ updatedApp: Application) {
        if let index = applications.firstIndex(where: { $0.id == updatedApp.id }) {
            applications[index] = updatedApp
        }
    }

    func deleteApplication(id: String) {
        applications.removeAll { $0.id == id }
    }
    
}
