//
//  ViewController.swift
//  MPersianCalender
//
//  Created by notron on 11/8/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let reuseCell = "DayCollectionViewCell"
    @IBOutlet weak var collectionView: UICollectionView!
    
    var calender : [[Date]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calender = CalenderHelper().getCalender(count: 365)
        
        collectionView.register(UINib(nibName: reuseCell, bundle: nil), forCellWithReuseIdentifier: reuseCell)
        
        let width = collectionView.frame.width / 7
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        
        collectionView.dataSource = self
        collectionView.delegate   = self
        
    }

}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        
        return calender.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return calender[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseCell, for: indexPath) as! DayCollectionViewCell
        
        cell.config(date: calender[indexPath.section][indexPath.row])
        return cell
    }
    
    
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//
//        let width = collectionView.frame.width / 8
//        return CGSize (width: width, height: width)
//    }
    
}
