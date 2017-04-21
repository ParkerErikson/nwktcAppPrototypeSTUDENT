//
//  HomeViewController.swift
//  NWKTC app prototype
//
//  Created by Zachary White on 4/19/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var sectionsTblView: UITableView!
    @IBOutlet weak var selectedTblView: UITableView!
    
    lazy var sections = ["News","Admin", "Automotive Technology", "Business Technology", "Carpentry", "Collision Repair", "Computer Graphics Technology", "Cosmetology", "Crime Scene Investigation", "Kansas Institute of Diesel Technology", "Electrical Technology", "Engineering and Drafting Technology", "Medical Assistant", "Mobile App and Gaming", "Network Technology", "Precision Agriculture Technology", "Respiratory Therapy", "Welding"]
    
    
    lazy var selectedSections = ["Department","UpComming", "Department Info", "Contancts"]
    lazy var sectionGroups = ["News", "Departments"]
    
    lazy var upComming = ["Events for Department"]
    lazy var departmentInfo = ["Department Info and Stuff"]
    lazy var contacts = ["Contact/Contact Info"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (tableView == sectionsTblView) {
            return sectionGroups.count
        }
        if (tableView == selectedTblView) {
            return selectedSections.count
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (tableView == sectionsTblView) {
            return sectionGroups[section]
        } else {
            return selectedSections[section]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView == sectionsTblView) {
            if (section == 0) {
                return 1
            }
            return sections.count
        }
        if (tableView == selectedTblView) {
            return 1
        }
        else {
            return 0
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == sectionsTblView) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! SectionCells
            
            cell.textLabel?.text = sections[indexPath.row]
            cell.textLabel?.textColor = #colorLiteral(red: 0.8532782197, green: 0.1581068337, blue: 0.194409132, alpha: 1)
            cell.textLabel?.numberOfLines = 2
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "selectedCell", for: indexPath) as! SelectedCells
            
            if (tableView == selectedTblView) {
                switch (indexPath.section) {
                case 0:
                    cell.selectedDesc.isHidden = true
                    cell.selectedLbl.text = "Department"
                    cell.selectedImg.image = #imageLiteral(resourceName: "Maverick-Mascot")
                    cell.selectedDesc.text = "hi"
                    cell.selectedInfo.text = "Mobile Apps and Gaming"
                case 1:
                    cell.selectedLbl.text = "UpComming"
                    cell.selectedDesc.text = "Stuff and Things will be happening with more Stuff and Things to come by later"
                case 2:
                    cell.selectedLbl.text = "Department Info"
                    cell.selectedDesc.text = "Learn how to develop apps in the rapidly expanding iPhone and iPad market. The iOS architecture is one of the fastest growing technology opportunities in modern history. The training received from our Mobile App and Entertainment Development program will enable you to create apps and games for the iPhone, iPod Touch, and iPad and to build cross-platform, mobile web-apps that will run on nearly any modern smart-phone and tablet platform including iPhone, Android, Blackberry, Windows Mobile and more."
                case 3:
                    cell.selectedLbl.text = "Contacts"
                    cell.selectedDesc.isHidden = true
                    cell.selectedImg.image = #imageLiteral(resourceName: "AndrewStrange")
                    cell.selectedContactName.text = "Andrew Strange"
                    cell.selectedContactNum.text = "(785)-890-1599"
                    cell.selectedInfo.text = "*Insert Chewbacca Sounds*"
                default:
                    cell.selectedLbl.text = "Other"
                }
            }
            
            cell.selectedLbl?.textColor = #colorLiteral(red: 0.8532782197, green: 0.1581068337, blue: 0.194409132, alpha: 1)
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == sectionsTblView) {
            print("\(sections[indexPath.row])")
        } else {
            print("\(selectedSections[indexPath.row])")
        }
    }
}
