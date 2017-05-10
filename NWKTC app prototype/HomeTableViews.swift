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

class titleCell : UITableViewCell {
    @IBOutlet weak var titleImage: UIImageView!
    @IBOutlet weak var titleCell: UILabel!
    @IBOutlet weak var feedbackBtn: UIButton!

    
}

class NewsCell : UITableViewCell {
    @IBOutlet weak var newsTF: UITextView!
    
}

class DescriptionCell: UITableViewCell {
    @IBOutlet weak var descriptionTF: UITextView!
}

class ContactsCell: UITableViewCell {
    @IBOutlet weak var contactImg: UIImageView!
    @IBOutlet weak var contactName: UILabel!
    @IBOutlet weak var contactNumber: UILabel!
}


