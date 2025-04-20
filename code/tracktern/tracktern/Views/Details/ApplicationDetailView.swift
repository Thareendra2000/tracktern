//
//  ApplicationDetailView.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import SwiftUI

struct ApplicationDetailView: View {
    @EnvironmentObject var viewModel: ApplicationViewModel
    @State var application: Application

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

            Section(header: Text("Interview Date")) {
                DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Interview Date") })
            }

            Section(header: Text("Notes")) {
                TextEditor(text: $application.notes)
                    .frame(height: 100)
            }

            Button("Save Changes") {
                viewModel.updateApplication(application)
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.blue)
            .foregroundColor(.white)
            .cornerRadius(10)
        }
        .navigationTitle("Application Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}
