//
//  EventTableViewCell.swift
//  EventsTask
//
//  Created by Ajay Sangani on 24/05/22.
//

import UIKit

class EventTableViewCell: UITableViewCell {
    
    @IBOutlet var dayLabel: UILabel!
    @IBOutlet var eventDateLabel: UILabel!
    @IBOutlet var eventDescLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: configureData
    func configureData(date: Date, events: [Event]) {
        eventDateLabel.text = ""
        eventDescLabel.text = ""
        
        dayLabel.text = date.toString(dateFormat: "d MMM")
        
        //Configure Today's events
        let currentDate = date.toString(dateFormat: "dd-MM-YYYY")
        for item in 0..<events.count {
            if let event = events[item] as? Event {
                if let eventDate = event.date?.toString(dateFormat: "dd-MM-YYYY") {
                    if currentDate == eventDate {
                        eventDateLabel.text = eventDate
                        eventDescLabel.text = event.eventDesc ?? "N/A"
                    }
                }
            }
        }
    }
}
