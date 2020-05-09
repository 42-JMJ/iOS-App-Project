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

    @IBOutlet var boxTop: UILabel!
    @IBOutlet var boxBottom: UILabel!
    
    private var sqldb: DataBase = SqliteDataBase.instance
    private var article: Article?
    var dateToSet: Date?
    let picker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setArticle(date: dateToSet)
        setLayerRank()
        setComponentsStyle()
        if article?.answer == "" {
            beginAnimate()
        }
        showArticle(article: article!)
        adjustWritingMode()
        textViewAnswer.delegate = self
        picker.delegate = self
    }
 
    private func setArticle(date: Date?) {
        let dateToSet: Date
        if date == nil {
            dateToSet = Date()
        } else { dateToSet = date! }
        article = sqldb.selectArticle(date: dateToSet)
    }
    
    func setLayerRank() {
        labelDate.layer.zPosition = 4
        btnList.layer.zPosition = 4
        btnImagePicker.layer.zPosition = 4
        btnSave.layer.zPosition = 4
        labelQuestion.layer.zPosition = 4
        labelPlaceHolder.layer.zPosition = 4
        textViewAnswer.layer.zPosition = 6
        boxTop.layer.zPosition = 2
        boxBottom.layer.zPosition = 2
        backgroundImage.layer.zPosition = 0
    }
    
    private func setComponentsStyle() {
        boxTop.layer.cornerRadius = 15
        boxTop.layer.masksToBounds = true
        boxTop.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        boxBottom.layer.cornerRadius = 15
        boxBottom.layer.masksToBounds = true
        boxBottom.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        
        labelDate.textColor = .white
        labelQuestion.textColor = .white
        
        btnList.setImage(UIImage(named: "to_list_white"), for: .normal)
        btnImagePicker.setImage(UIImage(named: "to_photolibrary_white"), for: .normal)
        btnList.imageView?.contentMode = .scaleAspectFill
        btnSave.imageView?.contentMode = .scaleAspectFill
        btnImagePicker.imageView?.contentMode = .scaleAspectFill
        btnList.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25,
                                               bottom: 25, right: 25)
        btnSave.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25,
                                               bottom: 25, right: 25)
        btnImagePicker.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25,
                                                      bottom: 25, right: 25)
    }
    
    private func beginAnimate() {
        labelQuestion.alpha = 0
        labelPlaceHolder.alpha = 0
        labelDate.alpha = 0
        btnList.alpha = 0
        btnImagePicker.alpha = 0
        btnSave.alpha = 0
        boxTop.alpha = 0
        
        UIView.animate(withDuration: 4, delay: 0,
                       options: .curveEaseOut,
                       animations: {self.labelQuestion.alpha = 1.0})
        UIView.animate(withDuration: 1.5, delay: 4,
                       options: .curveEaseOut,
                       animations: {self.labelPlaceHolder.alpha = 1.0})
        UIView.animate(withDuration: 2, delay: 4,
                       options: .curveEaseOut,
                       animations: {self.labelDate.alpha = 1.0})
        UIView.animate(withDuration: 2, delay: 4,
                       options: .curveEaseOut,
                       animations: {self.btnList.alpha = 1.0})
        UIView.animate(withDuration: 2, delay: 4,
                       options: .curveEaseOut,
                       animations: {self.btnImagePicker.alpha = 1.0})
        UIView.animate(withDuration: 2, delay: 4,
                       options: .curveEaseOut,
                       animations: {self.btnSave.alpha = 1.0})
        UIView.animate(withDuration: 2, delay: 4,
                       options: .curveEaseOut,
                       animations: {self.boxTop.alpha = 0.6})
    }

    private func showArticle(article: Article) {
        labelDate.text = dateToStr(article.date, "M월 d일")
        textViewAnswer.textContainerInset
            = UIEdgeInsets(top: 20, left: 25, bottom: 20, right: 25)
        textViewAnswer.text = article.answer

        let style: NSMutableParagraphStyle = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let attr = [NSAttributedString.Key.paragraphStyle: style]
        labelQuestion.attributedText = NSAttributedString(string: article.question, attributes: attr)
        textViewAnswer.attributedText = NSAttributedString(string: textViewAnswer.text, attributes: attr)
        
        textViewAnswer.textColor = .white
        textViewAnswer.font = UIFont(name: "DXPnMStd-Regular", size: 17)
        if article.imagePath == "" {
            backgroundImage.image = UIImage(named: "catcat0")
        } else {
            backgroundImage.image = getUIImageFromDocDir(fileName: article.imagePath)
        }
        backgroundImage.contentMode = .scaleAspectFill
    }

    private func adjustWritingMode() {
        if textViewAnswer.text.isEmpty && article!.answer.isEmpty
            && article!.imagePath == "" {
            btnSave.setImage(UIImage(named: "to_save_gray"), for: .normal)
            btnSave.isUserInteractionEnabled    =   false
            labelPlaceHolder.isHidden           =   false
        } else {
            btnSave.setImage(UIImage(named: "to_save_white"), for: .normal)
            btnSave.isUserInteractionEnabled    =   true
            labelPlaceHolder.isHidden           =   true
        }
    }

    func textViewDidChange(_ textViewAnswer: UITextView) {
        adjustWritingMode()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @IBAction func btnListTouchOn(_ sender: UIButton) {
        if textViewAnswer.text != article?.answer {
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
            print("info: \(info)")
            backgroundImage.contentMode = .scaleAspectFill
            backgroundImage.image = pickedImage
            
            guard let fileName: String = saveUIImageToDocDir(image: pickedImage) else {
                print("save error")
                return
            }
            article?.imagePath = fileName
            if sqldb.updateArticle(article: article!) == true {
                print("Image Update Test Success!")
            } else {
                print("Image Update Test Error!")
            }
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
