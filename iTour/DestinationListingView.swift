//
//  DestinationListingView.swift
//  iTour
//
//  Created by Paul Hudson on 30/09/2023.
//

import SwiftData
import SwiftUI

struct DestinationListingView: View {
    @Environment(\.modelContext) var modelContext
    @Query(sort: [SortDescriptor(\Destination.priority, order: .reverse), SortDescriptor(\Destination.name)]) var destinations: [Destination]
    
    @State var showingPopup = false

    var body: some View {
        List {
            ForEach(destinations) { destination in
                NavigationLink(value: destination) {
                    VStack(alignment: .leading) {
                        Text(destination.name)
                            .font(.headline)

                        Text(getFormattedDate(date: destination.date))
                    }
                }
            }
            .onDelete(perform: deleteDestinations)
        }
    }

    init(sort: SortDescriptor<Destination>, searchString: String) {
        _destinations = Query(filter: #Predicate {
            if searchString.isEmpty {
                return true
            } else {
                return $0.name.localizedStandardContains(searchString)
            }
        }, sort: [sort])
    }

    func deleteDestinations(_ indexSet: IndexSet) {
        for index in indexSet {
            let destination = destinations[index]
            modelContext.delete(destination)
        }
    }
}

func getFormattedDate(date: Date = Date()) -> String {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "EE, d-MM-yy" // Customize the format as needed
    return dateFormatter.string(from: date)
}

#Preview {
    DestinationListingView(sort: SortDescriptor(\Destination.name), searchString: "")
}


