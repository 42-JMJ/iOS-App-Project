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
    
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var btnList: UIButton!
    @IBOutlet var btnEdit: UIButton!
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var labelQuestion: UILabel!
    @IBOutlet var labelAnswer: UILabel!
    
    @IBOutlet var boxTop: UILabel!
    @IBOutlet var boxBottom: UILabel!
    
    var dateToSet: Date?

    override func viewDidLoad() {
        super.viewDidLoad()

        checkDateToSet()
        setLayerRank()
        setComponentsBackground()
        adjustBottomBoxHeight()
    }
    
    func checkDateToSet() {
        if dateToSet != nil {
            print(dateToStr(dateToSet!, "yyyy년 MM월 dd일"))
        } else {
            print("dateToSet is empty")
        }
    }
    func setComponentsBackground() {
        boxTop.layer.cornerRadius = 15
        boxTop.layer.masksToBounds = true
        boxBottom.layer.cornerRadius = 15
        boxBottom.layer.masksToBounds = true
    }
    
    func setLayerRank() {
        labelDate.layer.zPosition = 2
        btnList.layer.zPosition = 2
        btnEdit.layer.zPosition = 2
        labelQuestion.layer.zPosition = 2
        labelAnswer.layer.zPosition = 2
        boxTop.layer.zPosition = 1
        boxBottom.layer.zPosition = 1
        imageView.layer.zPosition = 0
    }
    
    func adjustBottomBoxHeight() {
        labelAnswer.numberOfLines = 0
        labelAnswer.textColor = .white
        labelAnswer.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. \n Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
        labelAnswer.sizeToFit()
        boxBottom.frame.size.height = labelAnswer.frame.size.height + 140
    }
/*
    let strokeTextAttr = [
        NSAttributedString.Key.strokeColor : UIColor.white,
        NSAttributedString.Key.foregroundColor : UIColor.white,
        NSAttributedString.Key.strokeWidth : -4.0,
        NSAttributedString.Key.font : UIFont(name: "GyeonggiBatang", size: 19)!]
    as [NSAttributedString.Key : Any]
  */

    /*
    func setBtnQuestionStyle() {
        btnQuestion.layer.shadowColor = UIColor.black.cgColor
        btnQuestion.layer.shadowOffset = CGSize(width: 10, height: 10)
        btnQuestion.layer.shadowOpacity = 0.4
        btnQuestion.layer.shadowRadius = 10
        btnQuestion.layer.masksToBounds = false
    }
    */
}
