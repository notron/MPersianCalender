//
//  CalenderHelper.swift
//  MPersianCalender
//
//  Created by notron on 11/8/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import Foundation

class CalenderHelper {
    
    func getCalender(count: Int) -> [[Date]] {
        
        var dates : [[Date]] = []
        
        let startDate    = Date()
        let calendar     = Calendar.current
        var offset       = DateComponents()
        var currentMonth : [Date] = []
        var monthIndex   : Int?
        
        currentMonth.append(startDate)
        
        
        for i in 1..<count {
            offset.day = i
            let nextDay: Date = calendar.date(byAdding: offset, to: startDate)!
            
            let formatter = DateFormatter()
            formatter.calendar = Calendar(identifier: .persian)
            formatter.dateFormat = "MM"
            let month = Int(formatter.string(from: nextDay))!
            
            if monthIndex == nil {
                monthIndex = month
            }
            
            if month == monthIndex {
                currentMonth.append(nextDay)
            } else {
                dates.append(currentMonth)
                currentMonth = []
                currentMonth.append(nextDay)
                monthIndex = month
            }
        }
        
        return dates
    }
    
}
