//
//  SurrahListViewCell.swift
//  Tajweed
//
//  Created by iMAC5 on 12/07/2019.
//  Copyright © 2019 Dev139. All rights reserved.
//

import UIKit

class SurrahListViewCell: UITableViewCell {
    
    @IBOutlet weak var surrahIndex: UILabel!
    @IBOutlet weak var surrahArabicName: UILabel!
    @IBOutlet weak var surrahEnglishName: UILabel!
    @IBOutlet weak var surrahRevealOrder: UILabel!
    
    var surrahList: SurrahList!{
        didSet {
            updateUI()
        }
    }
    
    func updateUI(){
        surrahIndex.text = "\(surrahList.surrahId)"
        surrahArabicName.text = surrahList.surrahArabicName
        surrahEnglishName.text = surrahList.surrahEnglishName
        surrahRevealOrder.text = "\(surrahList.surrahRevealOrder)"
    }
    
}
