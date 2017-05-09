//
//  HomeTableViews.swift
//  NWKTC app prototype
//
//  Created by Zachary White on 4/20/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit

class SectionCells: UITableViewCell {
    @IBOutlet weak var sectionLbl: UILabel!
    
}

class SelectedCells: UITableViewCell {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView?
    
    @IBOutlet weak var mainDesc: UITextView!
    
    @IBOutlet weak var contactInfo: UILabel!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactNum: UILabel!
    @IBOutlet weak var contactImg: UIImageView!
    
    @IBOutlet weak var feedbackBtn: UIButton!
}


