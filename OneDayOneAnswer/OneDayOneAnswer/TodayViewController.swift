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
    @IBOutlet var labelQuestion: UILabel!
    @IBOutlet var textViewAnswer: UITextView!
    @IBOutlet var labelPlaceHolder: UILabel!
    @IBOutlet var btnSave: UIButton!
    
    func setDateAndArticle(date: Date?) {
        let today: Date
        if date == nil {
            today = Date()
        } else {
            today = date!
        }
        let formatter           =   DateFormatter()
        formatter.dateFormat    =   "yyyy년 MM월 dd일"
        labelDate.textAlignment =   .center
        labelDate.text          =   String(formatter.string(from: today))

        let db: DataBase = TestDataBase.instance
        labelQuestion.text = db.selectArticle(date: today).question
    }
    
    func setTextViewAnswer() {
        textViewAnswer.textContainerInset
            = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
    }

    
    func setDisabledMode() {
        btnSave.setTitleColor(.gray, for: .normal)
        btnSave.isUserInteractionEnabled    =   false
        labelPlaceHolder.isHidden           =   false
    }
    
    func setEnabledMode() {
        btnSave.setTitleColor(.black, for: .normal)
        btnSave.isUserInteractionEnabled    =   true
        labelPlaceHolder.isHidden           =   true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textViewAnswer.delegate =   self
        setDateAndArticle(date:nil)
        setTextViewAnswer()
        setDisabledMode()
    }
    
    func textViewDidChange(_ textViewAnswer: UITextView) {
        if textViewAnswer.text.isEmpty == true {
            setDisabledMode()
        } else {
            setEnabledMode()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func btnListTouchOn(_ sender: UIButton) {
        if !textViewAnswer.text.isEmpty {
            let dataLostAlert = UIAlertController(title : "작성한 내용을 잃게됩니다", message: "계속하시겠습니까?", preferredStyle: UIAlertController.Style.alert)
            let doAction: UIAlertAction = UIAlertAction(title: "네", style: UIAlertAction.Style.default){
                UIAlertAction in
                self.performSegue(withIdentifier: "presentList", sender: self)
            }
            let cancelAction: UIAlertAction = UIAlertAction(title: "아니오", style: UIAlertAction.Style.default, handler: nil)
        
            dataLostAlert.addAction(doAction)
            dataLostAlert.addAction(cancelAction)
        
            present(dataLostAlert, animated: true, completion: nil)
        }
    }
}

