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

    func config(date: MDate) {
        
        let month = Int(date.date.toIranMonth)
        print("\(date.date) |||||| \(month)")
        title.text = Date().jalalimonthName(index: month!)
        
    }
    
    
}



