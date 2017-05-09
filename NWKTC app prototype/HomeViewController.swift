//
//  HomeViewController.swift
//  NWKTC app prototype
//
//  Created by Zachary White on 4/19/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var sectionsTblView: UITableView!
    @IBOutlet weak var selectedTblView: UITableView!
    
    
    lazy var chosen = "News"
    lazy var selectedDepartments = [String:String]()
    lazy var selectedDepContacts = [String:String]()
    var information = [[String:String]]()
    var contactInfo = [[String:String]]()
    
    var hSections = HomeSections()
    var contacts = Contacts()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = getInfoFromPlist(named: "Departments") as! [[String:String]]
            information = data
        
        let cInfo = getInfoFromPlist(named: "Contacts") as! [[String:String]]
        contactInfo = cInfo
        
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
        if (tableView == sectionsTblView) {
            return hSections.sectionGroups.count
        } else
        if (tableView == selectedTblView) {
            return hSections.selectedSections.count
        } else {
            return 0
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
                return information.count
            }
            return information.count
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
                // MARK: Need to change to instructor amount
                return selectedDepContacts.count
            }
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let info = selectedDepartments
        let contactInfo = selectedDepContacts
        
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

            if (tableView == selectedTblView) {
                switch (indexPath.section) {
                case 0:
                    cell.feedbackBtn.isHidden = false
                    cell.contactNum.isHidden = true
                    cell.contactImg.isHidden = true
                    cell.contactInfo.isHidden = true
                    cell.mainDesc.isHidden = true
                    cell.titleLbl.text = "\(info["Department"] ?? "No Department")"
                    cell.mainImg?.image = UIImage(named: "\(info["Image"] ?? "No Image")")
                case 1:
                    cell.contactNum.isHidden = true
                    cell.contactImg.isHidden = true
                    cell.contactInfo.isHidden = true
                    cell.mainImg?.isHidden = true
                    cell.feedbackBtn.isHidden = true
                    cell.titleLbl.text = "UpComing"
                    cell.mainDesc.text = "\(info["UpComing"] ?? "No UpComing")"
                case 2:
                    cell.feedbackBtn.isHidden = true
                    cell.titleLbl.text = "Description"
                    cell.mainDesc.text = "\(info["DepartmentInfo"] ?? "No Department Info")"
                case 3:
                    cell.mainDesc.isHidden = true
                    cell.feedbackBtn.isHidden = true
                    cell.titleLbl.text = "Contacts"
                    cell.contactImg.image = UIImage(named: "\(contactInfo["Name"] ?? "No Image")")
                    cell.contactName.text = "\(contactInfo["Name"] ?? "No Name")"
                    cell.contactNum.text = "\(contactInfo["Number"] ?? "No Number")"
                    cell.contactInfo.text = "\(contactInfo["Brief Description"] ?? "No Description")"
                default:
                    cell.titleLbl.text = "Other"
                }
            }
            cell.titleLbl?.textColor = #colorLiteral(red: 0.8532782197, green: 0.1581068337, blue: 0.194409132, alpha: 1)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (tableView == sectionsTblView) {
            if (indexPath.section == 0) {
                selectedDepartments = information[indexPath.row]
                selectedTblView.reloadData()
            }
            if (indexPath.section == 1) {
                selectedDepartments = information[indexPath.row]
                selectedDepContacts = contactInfo[indexPath.row]
                selectedTblView.reloadData()
            }
        }
    }
}
