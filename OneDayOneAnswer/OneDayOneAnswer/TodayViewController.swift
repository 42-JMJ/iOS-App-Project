//
//  TodayViewController.swift
//  OneDayOneAnswer
//
//  Created by Mihye Kim on 23/04/2020.
//  Copyright © 2020 JMJ. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var textViewAnswer: UITextView!
    @IBOutlet var labelPlaceHolder: UILabel!
    
    func DateAsString() -> String {
        let today = Date() // 현재시간을 가져옴
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        let dateString = formatter.string(from: today)
        return dateString
    }
    
    func setTextView() {
        self.textViewAnswer.layer.borderWidth = 1.0
        self.textViewAnswer.layer.borderColor = UIColor.darkGray.cgColor
        self.textViewAnswer.layer.cornerRadius = 10 // 모서리 둥글게
        self.textViewAnswer.textContainerInset = UIEdgeInsets(top: 20, left: 5, bottom: 20, right: 5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        labelDate.textAlignment = .center
        labelDate.text = String(DateAsString())
        
        textViewAnswer.delegate = self
        setTextView()
    }
    
    func textViewDidChange(_ textViewAnswer: UITextView) {
        labelPlaceHolder.isHidden = !textViewAnswer.text.isEmpty
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

