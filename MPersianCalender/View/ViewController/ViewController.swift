//
//  ViewController.swift
//  MPersianCalender
//
//  Created by notron on 11/8/19.
//  Copyright © 2019 Mahdi Moayeri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let reuseCell   = "DayCollectionViewCell"
    fileprivate let reuseHeader = "HeaderCollectionReusableView"
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var calender : [[Date]] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        calender = CalenderHelper().getCalender(count: 365)
       
        
        let width = collectionView.frame.width / 8
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 10, right: 0)
        layout.itemSize = CGSize(width: width, height: width)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        collectionView.collectionViewLayout = layout
        collectionView.register(UINib(nibName: reuseCell, bundle: nil), forCellWithReuseIdentifier: reuseCell)
        collectionView.register(UINib(nibName: reuseHeader, bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: reuseHeader)
        
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
        

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
            return CGSize(width:collectionView.frame.size.width, height:30)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: reuseHeader, for: indexPath) as! HeaderCollectionReusableView
        header.config(date: calender[indexPath.section].first!)
        return header
    }
    
}
