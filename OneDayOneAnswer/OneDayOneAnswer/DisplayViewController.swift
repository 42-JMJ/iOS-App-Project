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
    
    var dateToSet: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print(dateToStr(dateToSet!, "yyyy년 MM월 dd일"))
    }
    
    
}
