//
//  DayCollectionViewCell.swift
//  MPersianCalender
//
//  Created by notron on 11/8/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import UIKit

class DayCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var label: UILabel!

    func config(date: Date) {

        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .persian)
        formatter.dateFormat = "yyyy"
        let year = formatter.string(from: date)
        formatter.dateFormat = "MM"
        let month = formatter.string(from: date)
        formatter.dateFormat = "dd"
        let day = formatter.string(from: date)
        
        label.text = day
    }

}
