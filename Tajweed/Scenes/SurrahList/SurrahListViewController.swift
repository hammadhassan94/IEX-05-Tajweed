//
//  SurrahtableViewController.swift
//  Tajweed
//
//  Created by iMAC5 on 10/07/2019.
//  Copyright © 2019 Dev139. All rights reserved.
//

import UIKit


class SurrahListViewController: UITableViewController {
    
    /// List of surrahs that can be used to build burgers
    private var surrahList = [SurrahList]()
    public var colorAnnotations = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        var temp = Category()
        temp.categoryName = "Ghunnah"
        temp.schemes.schemeRule["ghunnah"] = CIColor(color: UIColor.green).stringRepresentation
        colorAnnotations.append(temp)
        
        
        
        temp = Category()
        temp.categoryName = "Idghaam"
        temp.schemes.schemeRule["idghaam_ghunnah"] = CIColor(color: UIColor()).stringRepresentation
        temp.schemes.schemeRule["idghaam_no_ghunnah"] = CIColor(color: UIColor()).stringRepresentation
        temp.schemes.schemeRule["idghaam_mutajaanisain"] = CIColor(color: UIColor()).stringRepresentation
        temp.schemes.schemeRule["idghaam_mutaqaaribain"] = CIColor(color: UIColor()).stringRepresentation
        temp.schemes.schemeRule["idghaam_shafawi"] = CIColor(color: UIColor()).stringRepresentation
        colorAnnotations.append(temp)
        
        
        temp = Category()
        temp.categoryName = "Ikhfa"
        temp.schemes.schemeRule["ikhfa"] = CIColor(color: UIColor()).stringRepresentation
        temp.schemes.schemeRule["ikhfa_shafawi"] = CIColor(color: UIColor()).stringRepresentation
        colorAnnotations.append(temp)
        
        temp = Category()
        temp.categoryName = "Iqlab"
        temp.schemes.schemeRule["iqlab"] = CIColor(color: UIColor()).stringRepresentation
        colorAnnotations.append(temp)
        
        temp = Category()
        temp.categoryName = "Madd"
        temp.schemes.schemeRule["madd_2"] = CIColor(color: UIColor()).stringRepresentation
        temp.schemes.schemeRule["madd_246"] = CIColor(color: UIColor()).stringRepresentation
        temp.schemes.schemeRule["madd_muttasil"] = CIColor(color: UIColor()).stringRepresentation
        temp.schemes.schemeRule["madd_munfasil"] = CIColor(color: UIColor()).stringRepresentation
        temp.schemes.schemeRule["madd_6"] = CIColor(color: UIColor()).stringRepresentation
        colorAnnotations.append(temp)
        
        temp = Category()
        temp.categoryName = "Qalqalah"
        temp.schemes.schemeRule["qalqalah"] = CIColor(color: UIColor()).stringRepresentation
        colorAnnotations.append(temp)
        
        temp = Category()
        temp.categoryName = "Hamzat al-Wasl"
        temp.schemes.schemeRule["hamzat_wasl"] = CIColor(color: UIColor()).stringRepresentation
        colorAnnotations.append(temp)
        
        temp = Category()
        temp.categoryName = "Lam al-Shamsiyyah"
        temp.schemes.schemeRule["lam_shamsiyyah"] = CIColor(color: UIColor()).stringRepresentation
        colorAnnotations.append(temp)
        
        temp = Category()
        temp.categoryName = "Silent"
        temp.schemes.schemeRule["silent"] = CIColor(color: UIColor()).stringRepresentation
        colorAnnotations.append(temp)
        
        
        
        
        
        
        
        
        
        
        
        //We connect database on entering point of main storyborad named SurrahTableViewController
        connectDatabase()
        
        //get that list of surrahs
        surrahList = getSurrahList()
    }
    
    // Called when the view is about to made visible. Default does nothing
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    // Called when the view is dismissed, covered or otherwise hidden. Default does nothing
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return surrahList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 1. Load a cell for the specified reuse identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: "surrahReuseIdentifier", for: indexPath) as! SurrahListViewCell
        
        // 2. Customise the loaded cell
        let surrah = surrahList[indexPath.row]
        //We have instead made a class for holding different lables of surrah list
        //cell.textLabel?.text = surrah.surrahArabicName
        cell.surrahList = surrah
        
        // 3. Return the cell to the table view to display
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        //let verseStoryboardScene = SurrahVerseViewController()
        
        let verseStoryboardScene = UIStoryboard(name: "SurrahVerse", bundle: nil).instantiateViewController(withIdentifier: "surahverseviewcontroller") as! SurrahVerseViewController
        // .instantiatViewControllerWithIdentifier() returns AnyObject! this must be downcast to utilize it
        
        //  self.presentViewController(viewController, animated: false, completion: nil)
        
        //Get selected surrah data from surrah list
        let surrah = surrahList[indexPath.row]
        verseStoryboardScene.surrahData  = surrah
        
        // 3. Push the instantiated view controller onto the navigation stack
        navigationController?.pushViewController(verseStoryboardScene, animated: true)
    }
}




