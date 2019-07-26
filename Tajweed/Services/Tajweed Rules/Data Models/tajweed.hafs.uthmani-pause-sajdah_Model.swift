//
//  tajweed.hafs.uthmani-pause-sajdah_Model.swift
//  Tajweed
//
//  Created by iMAC5 on 19/07/2019.
//  Copyright © 2019 Dev139. All rights reserved.
//

import Foundation
import UIKit

struct Quran: Decodable {
    var quran: [ResponseData]
}
struct ResponseData: Decodable {
    var annotations: [Annotations]
    var ayah: Int
    var surah: Int
}
struct Annotations : Decodable {
    var end: Int
    var rule: String
    var start: Int
}
struct Ayyah: Decodable {
    var annotations = [Annotations]()
    var ayah = Int()
}
struct FinalResult: Decodable {
    var ayyah = [Ayyah]()
}

func loadJson(fileName: String, surrahnumber: Int) -> FinalResult? {
    var final = FinalResult()
    var temp = Ayyah()
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Quran.self, from: data)
            
            for data in jsonData.quran
            {
                if (data.surah == surrahnumber) {
                    temp.ayah = data.ayah
                    temp.annotations = data.annotations
                    final.ayyah.append(temp)
                }
            }
            return final
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}


func charOnRuleColor(label: UILabel, color: UIColor, index: Int, length: Int) {
    
    //First we get the text.
    let string = label.text
    
    //Set Range
    let range = NSRange(location: index, length: length)
    let attributedString = NSMutableAttributedString(string: string!, attributes: nil)
    
    //Set label
    attributedString.addAttribute(NSAttributedString.Key.foregroundColor, value: color, range: range)
    label.attributedText = attributedString
    
}
