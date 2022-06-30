//
//  String+Extension.swift
//  EventsTask
//
//  Created by Ajay Sangani on 24/05/22.
//

import Foundation

extension String {
    func toDateTime(format: String = "yyyy-MM-dd'T'HH:mm:ss") -> Date {
        let formatter = DateFormatter()
        formatter.timeZone = NSTimeZone(name: "UTC")! as TimeZone
        formatter.dateFormat = format
        let dateFromString : Date = formatter.date(from: self)!
        return dateFromString
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: NSCharacterSet.whitespacesAndNewlines)
    }
}
