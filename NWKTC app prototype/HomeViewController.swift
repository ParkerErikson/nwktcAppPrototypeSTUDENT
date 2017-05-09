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
    
    lazy var chosen = "News"
    
    var depDesc = DepartmentDescriptions()
    var hSections = HomeSections()
    var contacts = Contacts()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if (tableView == sectionsTblView) {
            return hSections.sectionGroups.count
        }
        if (tableView == selectedTblView) {
            return hSections.selectedSections.count
        } else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (tableView == sectionsTblView) {
            return hSections.sectionGroups[section]
        } else {
            return hSections.selectedSections[section]
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if (tableView == sectionsTblView) {
            if (section == 0) {
                return 2
            }
            if (section == 1) {
                return hSections.secondSection.count
            }
            return hSections.sections.count
        }
        if (tableView == selectedTblView) {
            if (section == 0) {
                return 1
            }
            if (section == 1) {
                return 1
            }
            if (section == 2) {
                return 1
            }
            if (section == 3) {
                return contacts.mobileInstructors.count
            }
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (tableView == sectionsTblView) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "sectionCell", for: indexPath) as! SectionCells
            if (indexPath.section == 0) {
                cell.textLabel?.text = hSections.firstSection[indexPath.row]
            }
            
            if (indexPath.section == 1) {
                cell.textLabel?.text = hSections.secondSection[indexPath.row]
            }
            cell.textLabel?.textColor = #colorLiteral(red: 0.8532782197, green: 0.1581068337, blue: 0.194409132, alpha: 1)
            cell.textLabel?.numberOfLines = 2
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "selectedCell", for: indexPath) as! SelectedCells
            
            //            if (tableView == selectedTblView) {
            //                switch (indexPath.section) {
            //                case 0:
            ////                    cell.contactNum.isHidden = true
            ////                    cell.contactImg.isHidden = true
            ////                    cell.mainDesc.isHidden = true
            ////                    cell.titleLbl.text = "Department"
            ////                    cell.mainImg.image = #imageLiteral(resourceName: "Maverick-Mascot")
            ////                    cell.contactInfo.text = "Mobile Apps and Gaming"
            //                case 1:
            ////                    cell.contactNum.isHidden = true
            ////                    cell.contactImg.isHidden = true
            ////                    cell.contactInfo.isHidden = true
            ////                    cell.mainImg.isHidden = true
            ////                    cell.feedbackBtn.isHidden = true
            ////                    cell.titleLbl.text = "UpComming"
            ////                    cell.mainDesc.text = "Stuff and Things will be happening with more Stuff and Things to come by later"
            //                case 2:
            //                    cell.titleLbl.text = "Department Info"
            //                    cell.mainDesc.text = "Learn how to develop apps in the rapidly expanding iPhone and iPad market. The iOS architecture is one of the fastest growing technology opportunities in modern history. The training received from our Mobile App and Entertainment Development program will enable you to create apps and games for the iPhone, iPod Touch, and iPad and to build cross-platform, mobile web-apps that will run on nearly any modern smart-phone and tablet platform including iPhone, Android, Blackberry, Windows Mobile and more."
            //                case 3:
            //                    cell.mainDesc.isHidden = true
            //                    cell.feedbackBtn.isHidden = true
            //                    cell.titleLbl.text = "Contacts"
            //                    cell.contactImg.image = #imageLiteral(resourceName: "AndrewStrange")
            //                    cell.contactName.text = "Andrew Strange"
            //                    cell.contactNum.text = "(785)-890-1599"
            //                    cell.contactInfo.text = "*Insert Chewbacca Sounds*"
            //                default:
            //                    cell.titleLbl.text = "Other"
            //                }
            //}
            
            cell.titleLbl?.textColor = #colorLiteral(red: 0.8532782197, green: 0.1581068337, blue: 0.194409132, alpha: 1)
            
            return cell
        }
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == sectionsTblView) {
            if (indexPath.section == 0) {
                chosen = "\(hSections.firstSection[indexPath.row])"
                selectedTblView.reloadData()
            }
            if (indexPath.section == 1) {
                chosen = "\(hSections.secondSection[indexPath.row])"
                selectedTblView.reloadData()
            }
        }
    }
}
