//
//  Destination.swift
//  iTour
//
//  Created by Paul Hudson on 30/09/2023.
//

import Foundation
import SwiftData

@Model
class Destination {
    var day: String = ""
    var name: String = ""
    var details: String = ""
    var flight: String = ""
    var date: Date = Date()
    var residence: String = ""
    var residenceLink: String = ""
    var link: String = ""
    var comments: String = ""
    var priority: Int = 0
    var remarks: String = ""
    var what3words: String = ""
//    @Relationship(deleteRule: .cascade) var sights = [Sight]()
//    @Relationship(deleteRule: .cascade) var sights: [Sight]?

    init(name: String = "", details: String = "", flight: String = "", date: Date = .now, residence: String = "",  residenceLink: String = "", link: String = "", comments: String = "", priority: Int = 2) {
        self.name = name
        self.details = details
        self.date = date
        self.priority = priority
    }
}
