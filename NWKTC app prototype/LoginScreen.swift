//
//  ViewController.swift
//  NWKTC app prototype
//
//  Created by Parker Erikson on 4/12/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit

class LoginScreen: UIViewController {
    
    
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var loginOutlet: UIButton!
    @IBAction func login(_ sender: UIButton) {
        
    }
    @IBAction func empower(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://nwktc.empower-xl.com/fusebox.cfm")!, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
}

