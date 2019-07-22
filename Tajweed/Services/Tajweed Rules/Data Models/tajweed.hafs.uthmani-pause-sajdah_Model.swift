//
//  tajweed.hafs.uthmani-pause-sajdah_Model.swift
//  Tajweed
//
//  Created by iMAC5 on 19/07/2019.
//  Copyright © 2019 Dev139. All rights reserved.
//

import Foundation

//struct Annotations: Decodable {
//    var end: String
//    var rule: String
//    var start: String
//}
//
////struct AyyahOfSurrah: Decodable{
////    var annotations: [Annotations]
////    var ayah: String
////    var surah: String
////}
//
//struct Responsedata: Decodable{
//    var varse: [Annotations]
//}
//
//func loadJson(fiilename filename: String) -> [Annotations]? {
//    if let url = Bundle.main.url(forResource: filename, withExtension: "json"){
//        do{
//            let data = try Data(contentsOf: url)
//            let decoder = JSONDecoder()
//            let jsonData = try decoder.decode(Responsedata.self, from: data)
//            return jsonData.varse
//        }
//        catch{
//            print("error")
//        }
//    }
//    else{
//        print("file not found")
//    }
//    return nil
//}


struct Quran:Decodable {
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

func loadJson(filename fileName: String) -> Quran? {
    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(Quran.self, from: data)
            return jsonData
        } catch {
            print("error:\(error)")
        }
    }
    return nil
}
