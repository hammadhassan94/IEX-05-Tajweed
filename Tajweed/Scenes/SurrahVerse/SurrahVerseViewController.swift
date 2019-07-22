//
//  SurrahVerseViewController.swift
//  Tajweed
//
//  Created by iMAC5 on 15/07/2019.
//  Copyright © 2019 Dev139. All rights reserved.
//

import UIKit

class SurrahVerseViewController: UITableViewController {
    
    var surrahData: SurrahList!
    var surrahVerse: SurrahVerses!
    
    var jsonData: FinalResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        surrahVerse = getSurrah(surrahId: surrahData.surrahId)
        
        jsonData = loadJson(fileName: "tajweed_hafs_uthmani-pause-sajdah", surrahnumber: surrahData.surrahId)
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return surrahVerse.verseText.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "surrahVerserReuseIdentifier", for: indexPath) as! SurrahVerseViewCell
        
        let surrahSingleVerse = surrahVerse.verseText[indexPath.row]
        
        if indexPath.row == 0 && surrahVerse.surrahNumber == 1{
            cell.verseText.text = surrahSingleVerse
            cell.verseText.textAlignment = NSTextAlignment.center
        }
        else{
            cell.verseText.text = surrahSingleVerse
        }
        
        for data in jsonData.ayyah {
            let string = cell.verseText.text
            
            var attributedString: NSMutableAttributedString!
            attributedString = NSMutableAttributedString(string: string!, attributes: nil)
            
            if(data.ayah == indexPath.row + 1) {
                
                for annot in data.annotations {
                    //charOnRuleColor(label: cell.verseText, color: UIColor.red, index: annot.start, length: annot.end - annot.start)
                    
                    let range = NSRange(location: annot.start, length: annot.end - annot.start)
                    
                    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.red, range: range)
                }
                cell.verseText.attributedText = attributedString
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
