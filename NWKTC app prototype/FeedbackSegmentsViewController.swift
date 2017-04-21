//
//  FeedbackSegmentsViewController.swift
//  NWKTC app prototype
//
//  Created by Zachary White on 4/19/17.
//  Copyright © 2017 Parker Erikson. All rights reserved.
//

import UIKit

class FeedbackSegmentsViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}


@IBDesignable
class segments: UIScrollView {
    @IBInspectable var borderColor: UIColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) {
        didSet {
            layer.borderColor = borderColor.cgColor
        }
    }
}
