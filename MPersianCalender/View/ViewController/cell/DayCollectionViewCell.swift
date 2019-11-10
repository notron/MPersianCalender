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

    func config(date: MDate) {
        
        if date.isActive {
            label.isHidden = false
            label.text = date.date.toIranDay
        } else {
            label.isHidden = true
        }
    }

}
