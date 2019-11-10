//
//  Date.swift
//  MPersianCalender
//
//  Created by Mahdi on 11/10/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import Foundation

extension Date {
    
    var persianWeekNameDay : String {
        
        switch Calendar.current.component(.weekday, from: self)-1 {
        case 0:
            return "یک‌شنبه"
        case 1:
            return "دوشنبه"
        case 2:
            return "سه‌شنبه"
        case 3:
            return "چهارشنبه"
        case 4:
            return "پنج‌شنبه"
        case 5:
            return "جمعه"
        case 6:
            return "شنبه"
        default:
            return ""
        }
    }
    
    var persianWeekIndex : Int {
        return Calendar.current.component(.weekday, from: self)-1
    }
    
    public func jalalimonthName(index: Int) -> String {
        
        switch index {
        case 1:
            return "فروردین"
        case 2:
            return "اردیبهشت"
        case 3:
            return "خرداد"
        case 4:
            return "تیر"
        case 5:
            return "مرداد"
        case 6:
            return "شهریور"
        case 7:
            return "مهر"
        case 8:
            return "آبان"
        case 9:
            return "آذر"
        case 10:
            return "دی"
        case 11:
            return "بهمن"
        case 12:
            return "اسفند"
        default:
            return ""
        }
    }
    
    // Convert local time to UTC (or GMT)
    func toGlobalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = -TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    // Convert UTC (or GMT) to local time
    func toLocalTime() -> Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
    
    var toIranDay : String {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = "dd"
        
        return formatter.string(from: self)
    }
    
    var toIranMonth : String {
        
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = "MM"
        
        return formatter.string(from: self)
    }
    
    
}
