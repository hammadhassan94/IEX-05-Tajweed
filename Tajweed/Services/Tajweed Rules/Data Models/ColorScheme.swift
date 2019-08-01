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
    var schemeRule = [String:String]()
}

struct Category: Codable{
    var categoryName: String = ""
    var schemes = ColorScheme()
}








func getDocumentsURL() -> URL {
    if let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
        return url
    } else {
        fatalError("Could not retrieve documents directory")
    }
}

func savePostsToDisk(colorScheme: [Category]) {
    // 1. Create a URL for documents-directory/posts.json
    let url = getDocumentsURL().appendingPathComponent("colorAnnotations.json")
    // 2. Endcode our [Post] data to JSON Data
    let encoder = JSONEncoder()
    do {
        let data = try encoder.encode(colorScheme)
        // 3. Write this data to the url specified in step 1
        try data.write(to: url, options: [])
    } catch {
        fatalError(error.localizedDescription)
    }
}

func getPostsFromDisk() -> [Category] {
    // 1. Create a url for documents-directory/posts.json
    let url = getDocumentsURL().appendingPathComponent("colorAnnotations.json")
    let decoder = JSONDecoder()
    do {
        // 2. Retrieve the data on the file in this path (if there is any)
        let data = try Data(contentsOf: url, options: [])
        // 3. Decode an array of Posts from this Data
        let posts = try decoder.decode([Category].self, from: data)
        return posts
    } catch {
        fatalError(error.localizedDescription)
    }
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
