//
//  NotificationManager.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/21/25.
//

import Foundation
import UserNotifications

class NotificationManager {
    static let shared = NotificationManager()

    private init() {}

    func requestPermission() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if let error = error {
                print("🔴 Notification permission error: \(error.localizedDescription)")
            }
            print("🔔 Notification permission granted: \(granted)")
        }
    }

    func scheduleInterviewNotification(for app: Application) {
        guard let interviewDate = app.interviewDate else { return }

        let content = UNMutableNotificationContent()
        content.title = "📅 Upcoming Interview"
        content.body = "You have an interview for \(app.jobTitle) at \(app.companyName)."
        content.sound = .default

        let triggerDate = Calendar.current.dateComponents(
            [.year, .month, .day, .hour, .minute],
            from: interviewDate
        )

        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDate, repeats: false)

        let request = UNNotificationRequest(
            identifier: app.id,
            content: content,
            trigger: trigger
        )

        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("⚠️ Failed to schedule notification: \(error.localizedDescription)")
            } else {
                print("✅ Interview notification scheduled for \(interviewDate)")
            }
        }
    }
}
