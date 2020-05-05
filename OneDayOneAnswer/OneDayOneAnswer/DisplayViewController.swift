//
//  DisplayViewController.swift
//  OneDayOneAnswer
//
//  Created by Mihye Kim on 23/04/2020.
//  Copyright © 2020 JMJ. All rights reserved.
//

import Foundation

import UIKit

class DisplayViewController: UIViewController {
    
    @IBOutlet var btnQuestion: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setBtnQuestionStyle()
    }
    func setBtnQuestionStyle() {
        btnQuestion.layer.shadowColor = UIColor.black.cgColor
        btnQuestion.layer.shadowOffset = CGSize(width: 10, height: 10)
        btnQuestion.layer.shadowOpacity = 0.4
        btnQuestion.layer.shadowRadius = 10
        btnQuestion.layer.masksToBounds = false
    }
}
