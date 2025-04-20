//
//  trackternApp.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/18/25.
//

import SwiftUI

@main
struct TrackternApp: App {
    @StateObject private var viewModel = ApplicationViewModel()

    var body: some Scene {
        WindowGroup {
            MainTabView()
                .environmentObject(viewModel)
        }
    }
}

