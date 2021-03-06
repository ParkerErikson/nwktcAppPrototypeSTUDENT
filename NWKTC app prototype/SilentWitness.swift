//
//  SilentWitness.swift
//  NWKTC app prototype
//
//  Created by Parker Erikson on 4/19/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit

class SilentWitness: UIViewController {

    
    var confession : String?
    
    @IBOutlet weak var silentConfession: UITextView!
    
    @IBOutlet weak var submitOutlet: UIButton!
    @IBAction func submit(_ sender: UIButton) {
        confession = silentConfession.text
        submitOutlet.setTitle("Submitted", for: .normal)
        submitOutlet.isEnabled = false
        silentConfession.isEditable = false
    }
    
    
    override func viewDidLoad(){
        super.viewDidLoad()

    }

}
