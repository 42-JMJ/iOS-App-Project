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
    @IBOutlet var btnList: UIButton!
    @IBOutlet var btnSave: UIButton!
    
    func selectArticle(date: Date?) -> Article {
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
        return db.selectArticle(date: today)
    }
    
    func readQuestion(article: Article) {
        labelQuestion.text = article.question
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

    func animate() {
        self.labelQuestion.alpha = 0
        self.labelPlaceHolder.alpha = 0
        self.btnList.alpha = 0
        self.btnSave.alpha = 0

        UIView.animate(withDuration: 5, delay: 0,
                       options: .curveEaseOut,
                       animations: {self.labelQuestion.alpha = 1.0})
        UIView.animate(withDuration: 3, delay: 2.5,
                       options: .curveEaseOut,
                       animations: {self.labelPlaceHolder.alpha = 1.0})
        UIView.animate(withDuration: 2, delay: 5,
                       options: .curveEaseOut,
                       animations: {self.btnList.alpha = 1.0})
        UIView.animate(withDuration: 2, delay: 5,
                       options: .curveEaseOut,
                       animations: {self.btnSave.alpha = 1.0})
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        animate()
        textViewAnswer.delegate =   self
        readQuestion(article: selectArticle(date: nil))
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
            let dataLostAlert = UIAlertController(title : "작성한 내용을 잃게되어요",
                                                  message: "그래도 계속 할까요?",
                                                  preferredStyle: .alert)
            let doAction: UIAlertAction = UIAlertAction(title: "네", style: .default){
                UIAlertAction in
                self.performSegue(withIdentifier: "presentList", sender: self)
            }
            let undoAction: UIAlertAction = UIAlertAction(title: "아니오", style: .default)
            dataLostAlert.addAction(doAction)
            dataLostAlert.addAction(undoAction)
            present(dataLostAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func btnSaveTouchOn(_ sender: UIButton) {
        let db: DataBase = TestDataBase.instance
        var articleOfToday: Article = selectArticle(date: nil)
        articleOfToday.answer = textViewAnswer.text
        if db.updateArticle(article: articleOfToday) == true {
            print("Update Test Success!")
        } else {
            print("Update Test Error!")
        }
    }
}

