//
//  SettingsViewController.swift
//  NWKTC app prototype
//
//  Created by Zachary White on 4/19/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    lazy var setting = ["Profile", "Brightness", "Text"]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func cancleBtn(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return setting.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCells", for: indexPath)
        
        cell.textLabel?.text = setting[indexPath.row]
        cell.textLabel?.textColor = #colorLiteral(red: 0.8532782197, green: 0.1581068337, blue: 0.194409132, alpha: 1)
        cell.textLabel?.numberOfLines = 2
        
        return cell
    }
    
    
    
}
