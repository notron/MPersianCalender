//
//  CalenderHelper.swift
//  MPersianCalender
//
//  Created by notron on 11/8/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import Foundation

class CalenderHelper {
    
    func getCalender(count: Int) -> [[MDate]] {
        
        var dates : [[MDate]] = []
        
        let startDate    = Date()
        let calendar     = Calendar.current
        var offset       = DateComponents()
        var currentMonth : [MDate] = []
        var monthIndex   : Int?
        
        
        currentMonth.append(MDate(date: startDate))
        
        
        for i in 1..<count {
            offset.day = i
            let nextDay: Date = calendar.date(byAdding: offset, to: startDate)!
            let month = Int(nextDay.toIranMonth)!
            
            if monthIndex == nil {
                monthIndex = month
            }
            
            if month == monthIndex {
                currentMonth.append(MDate(date: nextDay))
            } else {
                dates.append(currentMonth)
                currentMonth = []
                monthIndex = month
                
                for _ in 0...nextDay.persianWeekIndex {
                    let date = MDate(date: Date())
                    date.isActive = false
                    currentMonth.append(date)
                }
                
                currentMonth.append(MDate(date: nextDay))
            }
        }
        
        return dates
    }
    
}
