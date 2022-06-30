//
//  EventListViewModel.swift
//  EventsTask
//
//  Created by Ajay Sangani on 24/05/22.
//

import Foundation

enum Months : Int {
    case Jan = 1
    case Feb
    case Mar
    case Apr
    case May
    case Jun
    case Jul
    case Aug
    case Sep
    case Oct
    case Nov
    case Dec
}


class EventListViewModel {
    //    var years = DateFormatter().years(2016...2025)
    //    var month = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul","Aug", "Sep", "Oct", "Nov", "Dec"]
    
    var arrDates: [Date]?
    
    //MARK: getAllDates By Month and Year
    func getAllDates(month: Int, year: Int) -> [Date] {
        let dateComponents = DateComponents(year: year, month: month)
        let calendar = Calendar.current
        let date = calendar.date(from: dateComponents)!
        
        let range = calendar.range(of: .day, in: .month, for: date)!
        let numDays = range.count
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = TimeZone(abbreviation: "GMT+5:30")
        var arrDates = [Date]()
        for day in 1...numDays {
            let dateString = "\(year) \(month) \(day)"
            if let date = formatter.date(from: dateString) {
                arrDates.append(date)
            }
        }
        return arrDates
    }
    
    //MARK: storeEventsInUserDefaults
    func storeEventsInUserDefaults(events: [Event]) {
        do {
            // Create JSON Encoder
            let encoder = JSONEncoder()
            
            // Encode Event
            let data = try encoder.encode(events)
            
            // Write/Set Data
            UserDefaults.standard.set(data, forKey: "events")
            
        } catch {
            print("Unable to Encode Array of Notes (\(error))")
        }
    }
    
    //MARK: readDataFromUserDefaults
    func readDataFromUserDefaults() -> [Event] {
        // Read/Get Data
        var events = [Event]()
        if let data = UserDefaults.standard.data(forKey: "events") {
            do {
                // Create JSON Decoder
                let decoder = JSONDecoder()
                
                // Decode Events
                events = try decoder.decode([Event].self, from: data)
                
            } catch {
                print("Unable to Decode Notes (\(error))")
            }
        }
        return events
    }
}
