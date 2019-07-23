//
//  DatabaseServiceProvider.swift
//  Tajweed
//
//  Created by iMAC5 on 10/07/2019.
//  Copyright © 2019 Dev139. All rights reserved.
//

import Foundation
import SQLite

var dbConVar: Connection!

func connectDatabase(){
    
    
    do {
        dbConVar = try Connection((Bundle.main.resourceURL?.appendingPathComponent("quran-uthmani.db").path)!)
    }
    catch  {
    }
    
}
func getSurrahList()-> [SurrahList] {
    var surrahList = [SurrahList]()
    
    let surrahListTable  = Table("chapter")
    
    let surrahId = Expression<Int>("id")
    let surrahArabicName = Expression<String>("arabicname")
    let surrahEnglishName = Expression<String>("englishname")
    let surrahRevealOrder = Expression<Int>("revelorder")
    //    let surrahtype = Expression<String>("chaptertype")
    //    let surrahVerses = Expression<Int>("totalverses")
    //    let surrahStartVerse = Expression<Int>("startverse")
    //    let numberRukku = Expression<Int>("noofruku")
    
    do {
        for surrahData in try dbConVar.prepare(surrahListTable) {
            surrahList.append(SurrahList(surrahId: surrahData[surrahId], surrahArabicName: surrahData[surrahArabicName], surrahEnglishName: surrahData[surrahEnglishName], surrahRevealOrder: surrahData[surrahRevealOrder]))
        }
    } catch  {
    }
    
    return surrahList
}

func getSurrah(surrahId: Int)-> SurrahVerses {
    var surrahVerse = SurrahVerses()
    let surrahVersetable  = Table("quran")
    let surrahNumber = Expression<Int>("sura")
    let verseNumber = Expression<Int>("aya")
    let verseText = Expression<String>("text")
    
    do {
        for surrah in try dbConVar.prepare(surrahVersetable) {
            if surrahId == surrah[surrahNumber] {
                surrahVerse.verseNumber.append(surrah[verseNumber])
                surrahVerse.verseText.append(surrah[verseText])
            }
        }
    } catch  {
    }
    surrahVerse.surrahNumber = surrahId
    
    return surrahVerse
}
