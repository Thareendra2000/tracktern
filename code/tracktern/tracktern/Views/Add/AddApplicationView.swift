//
//  AddApplicationView.swift
//  tracktern
//
//  Created by Thareendra Tennakoon on 4/20/25.
//

import SwiftUI

struct AddApplicationView: View {
    @EnvironmentObject var viewModel: ApplicationViewModel

    @State private var companyName = ""
    @State private var jobTitle = ""
    @State private var dateApplied = Date()
    @State private var status: ApplicationStatus = .applied
    @State private var notes = ""
    @State private var interviewDate: Date? = nil

    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("Company")) {
                    TextField("Company Name", text: $companyName)
                }

                Section(header: Text("Job Title")) {
                    TextField("Job Title", text: $jobTitle)
                }

                Section(header: Text("Date Applied")) {
                    DatePicker("Date Applied", selection: $dateApplied, displayedComponents: [.date])
                }

                Section(header: Text("Status")) {
                    Picker("Status", selection: $status) {
                        ForEach(ApplicationStatus.allCases) { status in
                            Text(status.rawValue).tag(status)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }

                Section(header: Text("Interview Date (optional)")) {
                    DatePicker(selection: /*@START_MENU_TOKEN@*/.constant(Date())/*@END_MENU_TOKEN@*/, label: { Text("Interview Date") })
                }


                Section(header: Text("Notes")) {
                    TextEditor(text: $notes)
                        .frame(height: 100)
                }

                Button("Add Application") {
                    let newApp = Application(
                        id: UUID().uuidString,
                        companyName: companyName,
                        jobTitle: jobTitle,
                        dateApplied: dateApplied,
                        status: status,
                        notes: notes,
                        interviewDate: interviewDate
                    )
                    viewModel.addApplication(newApp)
                    clearForm()
                }
                .frame(maxWidth: .infinity)
                .padding()
            }
            .navigationTitle("Add Application")
        }
    }

    private func clearForm() {
        companyName = ""
        jobTitle = ""
        dateApplied = Date()
        status = .applied
        notes = ""
        interviewDate = nil
    }
}
