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
        
        var dates : [Date] = []
        
        let startDate = Date()
        let calendar  = Calendar.current
        var offset    = DateComponents()
        
        dates.append(startDate)
        
        for i in 1..<count {
            offset.day = i
            let nextDay: Date = calendar.date(byAdding: offset, to: startDate)!
            //let nextDayString = formatter.string(from: nextDay!)
            dates.append(nextDay)
        }
        
        return [dates]
    }
    
}
