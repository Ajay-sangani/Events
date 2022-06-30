//
//  DateFormater+Extension.swift
//  EventsTask
//
//  Created by Ajay Sangani on 24/05/22.
//

import Foundation
import UIKit

extension DateFormatter {
    func years<R: RandomAccessCollection>(_ range: R) -> [String] where R.Iterator.Element == Int {
        setLocalizedDateFormatFromTemplate("yyyy")
        var comps = DateComponents(month: 1, day: 1)
        var res = [String]()
        for y in range {
            comps.year = y
            if let date = calendar.date(from: comps) {
                res.append(string(from: date))
            }
        }
        return res
    }
}
