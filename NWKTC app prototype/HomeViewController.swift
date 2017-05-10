//
//  HomeViewController.swift
//  NWKTC app prototype
//
//  Created by Zachary White on 4/19/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController , UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var sectionsTblView: UITableView!
    @IBOutlet weak var selectedTblView: UITableView!
    
    lazy var selectedDepartments = [String:String]()
    lazy var selectedDepContacts = [String:String]()
    var information = [[String:String]]()
    var contactInfo = [[String:String]]()
    
    var hSections = HomeSections()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let data = getInfoFromPlist(named: "Departments") as! [[String:String]]
        information = data
        
        let cInfo = getInfoFromPlist(named: "Contacts") as! [[String:String]]
        contactInfo = cInfo
        
        
        // Do any additional setup after loading the view.
    }
    @IBAction func toFeedbackBtn(_ sender: UIButton) {
        performSegue(withIdentifier: "Feedback", sender: self)
    }
    
    @IBAction func logoutBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func accountSettings(_ sender: UIButton) {
        performSegue(withIdentifier: "Settings", sender: self)
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
        }
        return 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (tableView == sectionsTblView) {
            return hSections.sectionGroups[section]
        }
        return "Department"
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
        return 4
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let info = selectedDepartments
        let contactInfo = selectedDepContacts
        
        //Sections to the Side
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
        
        
        //Selected Sections
        
        if indexPath.row == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "titleCell", for: indexPath) as! titleCell
            cell.titleCell.text = "\(info["Department"] ?? "No Department")"
            cell.titleImage?.image = UIImage(named: "\(info["Image"] ?? "No Image")")
            return cell
        }
        else if indexPath.row == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as! NewsCell
            cell.newsTF.text = "\(info["UpComing"] ?? "No UpComing")"
            return cell
        } else if indexPath.row == 2 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionCell", for: indexPath) as! DescriptionCell
            cell.descriptionTF.text = "\(info["DepartmentInfo"] ?? "No Department Info")"
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ContactsCell", for: indexPath) as! ContactsCell
            cell.contactImg.image = UIImage(named: "\(contactInfo["Name"] ?? "No Image for Contact")")
            cell.contactName.text = "\(contactInfo["Name"] ?? "No Contact Name")"
            cell.contactNumber.text = "\(contactInfo["Number"] ?? "No Contact Number")"
            
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
