//
//  FeedbackViewController.swift
//  NWKTC app prototype
//
//  Created by Zachary White on 4/19/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit
//FAQ ViewController
class FeedbackViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //Frequently Asked Questions, Question/Answer
    var FAQQA = [[String:String]]()
    @IBOutlet weak var FAQTblView: UITableView!
    
    @IBOutlet weak var seperateSegments: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let faq = getInfoFromPlist(named: "FAQ") as! [[String:String]]
        FAQQA = faq
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
    
    @IBAction func cancleBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return FAQQA.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FAQCells", for: indexPath) as! FAQCell
        cell.answerTV.text = "Works?"
        cell.questionTitle.text = "Stuff"
        return cell
    }
    
}

class FAQCell: UITableViewCell {
    @IBOutlet weak var questionTitle: UILabel!
    @IBOutlet weak var answerTV: UITextView!
}
