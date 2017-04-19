//
//  HomeViewController.swift
//  NWKTC app prototype
//
//  Created by Zachary White on 4/19/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    lazy var sections = ["News","Admin", "Automotive Technology", "Business Technology", "Carpentry", "Collision Repair", "Computer Graphics Technology", "Cosmetology", "Crime Scene Investigation", "Kansas Institute of Diesel Technology", "Electrical Technology", "Engineering and Drafting Technology", "Medical Assistant", "Mobile App and Gaming", "Network Technology", "Precision Agriculture Technology", "Respiratory Therapy", "Welding"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath)
        
        // Configure the cell...
        
        cell.textLabel?.text = sections[indexPath.row]
        cell.textLabel?.textColor = #colorLiteral(red: 0.8532782197, green: 0.1581068337, blue: 0.194409132, alpha: 1)
        cell.textLabel?.numberOfLines = 2
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(sections[indexPath.row])")
    }
    
}
