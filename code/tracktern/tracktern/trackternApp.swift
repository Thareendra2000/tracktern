//
//  trackternApp.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/18/25.
//

import SwiftUI
import UserNotifications

@main
struct trackternApp: App {
    init() {
            NotificationManager.shared.requestPermission()
    }

    var body: some Scene {
        WindowGroup {
            SplashView()
                .environmentObject(ApplicationViewModel())
        }
    }
}

