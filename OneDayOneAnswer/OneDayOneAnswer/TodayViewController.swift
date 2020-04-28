//
//  TodayViewController.swift
//  OneDayOneAnswer
//
//  Created by Mihye Kim on 23/04/2020.
//  Copyright © 2020 JMJ. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var labelDate:        UILabel!
    @IBOutlet var textViewAnswer:   UITextView!
    @IBOutlet var labelPlaceHolder: UILabel!
    @IBOutlet var btnSave:          UIButton!
    
    func setDate() {
        let today               =   Date()
        let formatter           =   DateFormatter()
        formatter.dateFormat    =   "yyyy년 MM월 dd일"
        labelDate.textAlignment =   .center
        labelDate.text          =   String(formatter.string(from: today))
    }
    
    func setTextView() {
        self.textViewAnswer.layer.borderWidth   =   1.0
        self.textViewAnswer.layer.borderColor   =   UIColor.darkGray.cgColor
        self.textViewAnswer.layer.cornerRadius  =   10
        self.textViewAnswer.textContainerInset
            = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewAnswer.delegate =   self
        setDate()
        setTextView()
    }
    
    func textViewDidChange(_ textViewAnswer: UITextView) {
        labelPlaceHolder.isHidden           =   !textViewAnswer.text.isEmpty
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

