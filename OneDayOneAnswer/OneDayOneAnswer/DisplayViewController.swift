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
    
    func checkDateToSet() {
        if dateToSet != nil {
            print(dateToStr(dateToSet!, "yyyy년 MM월 dd일"))
        } else {
            print("dateToSet is empty")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkDateToSet()
    }
}
