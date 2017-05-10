//
//  NewsViewController.swift
//  NWKTC app prototype
//
//  Created by Zachary White on 5/10/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit

class NewsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    lazy var selectedDepartments = [String:String]()
    var information = [[String:String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = getInfoFromPlist(named: "Departments") as! [[String:String]]
        information = data
        // Do any additional setup after loading the view.
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
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let info = selectedDepartments
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
        cell.newsTF.text = "\(info["UpComing"] ?? "No UpComing")"
        return cell
    }
    
}

class NewsCell : UITableViewCell {
    @IBOutlet weak var newsTF: UITextView!
}
