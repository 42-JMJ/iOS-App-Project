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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayerRank()

    }
    
    func setLayerRank() {
        labelDate.layer.zPosition = 2
        btnList.layer.zPosition = 2
        btnEdit.layer.zPosition = 2
        labelQuestion.layer.zPosition = 2
        labelAnswer.layer.zPosition = 2
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
