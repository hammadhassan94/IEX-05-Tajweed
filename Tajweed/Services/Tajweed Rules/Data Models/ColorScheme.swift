//
//  ColorScheme.swift
//  Tajweed
//
//  Created by iMAC5 on 23/07/2019.
//  Copyright © 2019 Dev139. All rights reserved.
//

import Foundation
import UIKit

struct ColorScheme: Codable {
    let schemeRule: [String:String]
}








// MARK:- Solution of making UIcolor codable

//Solution I found is to create CIColor from the UIColor then convert back:
//
//Convert to string:
//
//CIColor(color: UIColor.blue).stringRepresentation
//Convert to color:
//
//UIColor(ciColor: CIColor(string: databaseColorString))
