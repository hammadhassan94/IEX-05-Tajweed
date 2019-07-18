//
//  SurrahList.swift
//  Tajweed
//
//  Created by iMAC5 on 10/07/2019.
//  Copyright © 2019 Dev139. All rights reserved.
//

import Foundation
struct SurrahList: Hashable,Codable {
    let surrahId: Int
    let surrahArabicName: String
    let surrahEnglishName: String
    let surrahRevealOrder: Int
    //    let surrahtype: String
    //    let surrahVerses: Int
    //    let surrahStartVerse: Int
    //    let numberRukku: Int
}
