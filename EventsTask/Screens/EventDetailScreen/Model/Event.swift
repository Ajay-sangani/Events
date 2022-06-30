//
//  Event.swift
//  EventsTask
//
//  Created by Ajay Sangani on 24/05/22.
//

import Foundation

struct Event: Codable {
    var date: Date?
    var time: String?
    var title: String?
    var eventDesc: String?
}
