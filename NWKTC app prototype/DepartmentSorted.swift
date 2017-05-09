//
//  DepartmentSorted.swift
//  NWKTC app prototype
//
//  Created by Zachary White on 5/9/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit

class sortingFactory : UIViewController {
    var information = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let data = getInfoFromPlist(named: "Departments") as! [[String:String]]
        information = data
    }
    
    func getInfoFromPlist(named : String) -> Any? {
        //Reading From a Plist
        if let url = Bundle.main.url(forResource: named, withExtension: "plist") {
            do{
                let data = try Data(contentsOf: url)
                do{
                    let plistContents = try PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil)
                    return(plistContents)
                    //...End Plist Read
                }
                catch {
                    print("Unable to Process Contnets of PLIST")
                }
            }
            catch {
                print("Unable to Generate Data")
            }
        }
        print("Unable to find \(named).plist")
        return nil
    }
    
    private func set(text : String, forCell cell : UITableViewCell?) {
        if let cell  = cell {
            cell.textLabel?.text = text
        }
    }
    
    private func parse(_ dictionary : [String:String], valueForKey key : String) -> String {
        if let ret = dictionary[key] {
            if ret != "" {
                return ret
            }
        }
        return "No \(key) Found"
    }
}
