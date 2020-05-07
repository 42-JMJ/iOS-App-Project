//
//  TodayViewController.swift
//  OneDayOneAnswer
//
//  Created by Mihye Kim on 23/04/2020.
//  Copyright © 2020 JMJ. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController, UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet var labelDate: UILabel!
    @IBOutlet var labelQuestion: UILabel!
    @IBOutlet var textViewAnswer: UITextView!
    @IBOutlet var labelPlaceHolder: UILabel!
    @IBOutlet var btnList: UIButton!
    @IBOutlet var btnSave: UIButton!
    @IBOutlet var btnImagePicker: UIButton!
    @IBOutlet var backgroundImage: UIImageView!
    
    private var sqldb: DataBase = SqliteDataBase.instance
    private var article: Article?
   
    var dateToSet: Date?
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        animate()
        if dateToSet == nil {
            selectArticle(date: nil)
        } else {
            selectArticle(date: dateToSet)
        }
        showArticle(article: article!)
        textViewAnswer.delegate = self
        picker.delegate = self
        setDisabledMode()
    }
 
    private func animate() {
        labelQuestion.alpha = 0
        labelPlaceHolder.alpha = 0
        labelDate.alpha = 0
        btnList.alpha = 0
        btnImagePicker.alpha = 0
        btnSave.alpha = 0
        
        UIView.animate(withDuration: 4, delay: 0,
                       options: .curveEaseOut,
                       animations: {self.labelQuestion.alpha = 1.0})
        UIView.animate(withDuration: 2, delay: 4,
                       options: .curveEaseOut,
                       animations: {self.labelPlaceHolder.alpha = 1.0})
        UIView.animate(withDuration: 1.5, delay: 7,
                       options: .curveEaseOut,
                       animations: {self.labelDate.alpha = 1.0})
        UIView.animate(withDuration: 1.5, delay: 7,
                       options: .curveEaseOut,
                       animations: {self.btnList.alpha = 1.0})
        UIView.animate(withDuration: 1.5, delay: 7,
                       options: .curveEaseOut,
                       animations: {self.btnImagePicker.alpha = 1.0})
        UIView.animate(withDuration: 1.5, delay: 7,
                       options: .curveEaseOut,
                       animations: {self.btnSave.alpha = 1.0})
    }
    
    private func selectArticle(date: Date?) {
        let today: Date
        if date == nil {
            today = Date()
        } else { today = date! }
        article = sqldb.selectArticle(date: today)
    }
    
    private func showArticle(article: Article) {
        labelDate.text = dateToStr(article.date, "yyyy년 MM월 dd일")
        textViewAnswer.text = article.answer
        textViewAnswer.textContainerInset
            = UIEdgeInsets(top: 20, left: 15, bottom: 20, right: 15)
        let style: NSMutableParagraphStyle = NSMutableParagraphStyle()
        style.lineSpacing = 18
        let attr = [NSAttributedString.Key.paragraphStyle: style]
        labelQuestion.attributedText = NSAttributedString(string: article.question, attributes: attr)
        textViewAnswer.attributedText = NSAttributedString(string: textViewAnswer.text, attributes: attr)
        textViewAnswer.font = UIFont(name: "GyeonggiBatang", size: 17)
    }

    private func setDisabledMode() {
        btnSave.imageView?.layer.transform = CATransform3DIdentity
        btnSave.isUserInteractionEnabled    =   false
        labelPlaceHolder.isHidden           =   false
    }

    private func setEnabledMode() {
        btnSave.imageView?.layer.transform = CATransform3DMakeScale(0.0, 0.0, 0.0)
        btnSave.isUserInteractionEnabled    =   true
        labelPlaceHolder.isHidden           =   true
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
        article!.answer = textViewAnswer.text
        if sqldb.updateArticle(article: article!) == true {
            print("Update Test Success!")
        } else {
            print("Update Test Error!")
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            backgroundImage.contentMode = .scaleAspectFill
            backgroundImage.image = pickedImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func pickImage(_ sender: Any) {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: DisplayViewController = segue.destination as? DisplayViewController else {
            return
        }
        nextViewController.dateToSet = dateToSet
    }
}
