//
//  ApplicationViewModel.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import Foundation

class ApplicationViewModel: ObservableObject {
    @Published var applications: [Application] = []

    init() {
        loadApplications()
    }

    func loadApplications() {
        self.applications = DataLoader.loadApplications()
    }

    func addApplication(_ application: Application) {
        applications.append(application)
        // Persistence logic can be added later
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
