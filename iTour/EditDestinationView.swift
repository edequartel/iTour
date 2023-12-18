//
//  EditDestinationView.swift
//  iTour
//
//  Created by Paul Hudson on 30/09/2023.
//

import SwiftUI
import SwiftData
import HighlightedTextEditor
import W3WSwiftApi
import W3WSwiftComponents
import CoreLocation


struct EditDestinationView: View {
    @Bindable var destination: Destination
    @State private var newSightName = ""
    
    var body: some View {
        Form {
            TextField("Dag", text: $destination.day)
                .bold()
            DatePicker("Date", selection: $destination.date, displayedComponents: .date)
            
                .datePickerStyle(.compact)
            TextField("Name", text: $destination.name)
            TextField("Details", text: $destination.details, axis: .vertical)
            
            HStack {
                Image(systemName: "house")
                TextField("Residence", text: $destination.residence)
            }
            //
            HStack {
                Button("Open") {
                    if let url = URL(string: destination.residenceLink) {
                        UIApplication.shared.open(url)
                    } else {
                        // Handle invalid URL
                        print("Invalid URL")
                    }
                }
                Spacer()
                TextField("Residence", text: $destination.residenceLink)
                
            }
            //
            HStack {
                
                Button("Open") {
                    if let url = URL(string: destination.link) {
                        UIApplication.shared.open(url)
                    } else {
                        // Handle invalid URL
                        print("Invalid URL")
                    }
                }
                Spacer()
                TextField("Link", text: $destination.link)
                
            }
            //
            
            
            HighlightedTextEditor(text: $destination.comments, highlightRules: .markdown)
                .frame(height: 150)
            
            HighlightedTextEditor(text: $destination.remarks, highlightRules: .markdown)
                .frame(height: 300)
            
            Section("Priority") {
                Picker("Priority", selection: $destination.priority) {
                    Text("-").tag(1)
                    Text("++").tag(2)
                    Text("+++").tag(3)
                }
                .pickerStyle(.segmented)
            }
            
            //            Section("Sights") {
            //                ForEach(destination.sights) { sight in
            //                    Text(sight.name)
            //                }
            //
            //                HStack {
            //                    TextField("Add a new sight in \(destination.name)", text: $newSightName)
            //
            //                    Button("Add", action: addSight)
            //                }
            //            }
        }
        .navigationTitle("Edit Destination")
        .navigationBarTitleDisplayMode(.inline)
    }
    
    //    func addSight() {
    //        guard newSightName.isEmpty == false else { return }
    //
    //        withAnimation {
    //            let sight = Sight(name: newSightName)
    //            destination.sights.append(sight)
    //            newSightName = ""
    //        }
    //    }
    
    
    
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Destination.self, configurations: config)
        let example = Destination(name: "Example Destination", details: "Example details go here and will automatically expand vertically as they are edited.")
        return EditDestinationView(destination: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container.")
    }
}
