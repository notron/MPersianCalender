//
//  HeaderCollectionReusableView.swift
//  MPersianCalender
//
//  Created by notron on 11/8/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    @IBOutlet weak var title: UILabel!

    func config(date: Date) {
        
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = "MM"
        let month = Int(formatter.string(from: date))
        
        title.text = jalalimonthName(index: month!)
        
    }
    
    
}


func jalalimonthName(index: Int) -> String {
    
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
