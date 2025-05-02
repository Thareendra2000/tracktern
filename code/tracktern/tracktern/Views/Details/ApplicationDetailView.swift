//
//  ApplicationDetailView.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import SwiftUI

struct ApplicationDetailView: View {
    @EnvironmentObject var viewModel: ApplicationViewModel
    @Environment(\.dismiss) private var dismiss
    @State var application: Application
    @State private var showSuccessAlert = false

    var body: some View {
        Form {
            Section(header: Text("Company")) {
                Text(application.companyName)
            }

            Section(header: Text("Job Title")) {
                Text(application.jobTitle)
            }

            Section(header: Text("Status")) {
                Picker("Status", selection: $application.status) {
                    ForEach(ApplicationStatus.allCases) { status in
                        Text(status.rawValue).tag(status)
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
            }

            Section(header: Text("Date Applied")) {
                Text(application.dateApplied.formatted(date: .abbreviated, time: .omitted))
            }

            Section(header: Text("Interview Date & Time")) {
                DatePicker("Interview Date & Time", selection: Binding(
                    get: {
                        application.interviewDate ?? Date()
                    },
                    set: { newDate in
                        application.interviewDate = newDate
                    }
                ), displayedComponents: [.date, .hourAndMinute])
            }


            Section(header: Text("Notes")) {
                TextEditor(text: $application.notes)
                    .frame(height: 100)
            }

            Button("Save Changes") {
                viewModel.updateApplication(application)
                showSuccessAlert = true
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationTitle("Application Details")
        .navigationBarTitleDisplayMode(.inline)
        .alert("✅ Application Updated Successfully!", isPresented: $showSuccessAlert) {
            Button("OK", role: .cancel) {
                dismiss()
            }
        }
    }
}
