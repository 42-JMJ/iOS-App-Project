//
//  TodayViewController.swift
//  OneDayOneAnswer
//
//  Created by Mihye Kim on 23/04/2020.
//  Copyright © 2020 JMJ. All rights reserved.
//

import UIKit

class TodayViewController: UIViewController {

    private let backgroundImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    private let topBox: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "DXPnMStd-Regular", size: 17)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var listBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "to_list_white"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btnListTouchOn), for: .touchDown)
        return btn
    }()

    private lazy var imgPickerBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "to_photolibrary_white"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(pickImage), for: .touchDown)
        return btn
    }()

    private lazy var saveBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "to_save_white"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(btnSaveTouchOn(_:)), for: .touchDown)
        return btn
    }()

    private let bottomBox: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        view.layer.cornerRadius = 15
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "DXPnMStd-Regular", size: 18)
        label.numberOfLines = 0
        label.textAlignment = .justified
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var answerText: UITextView = {
        let tv = UITextView()
        tv.textColor = .white
        tv.font = UIFont(name: "DXPnMStd-Regular", size: 17)
        tv.backgroundColor = .clear
        tv.delegate = self
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    private var sqldb: DataBase = SqliteDataBase.instance
    private var article: Article?
    var dateToSet: Date?
    let picker = UIImagePickerController()

    override func viewDidLoad() {
        super.viewDidLoad()

        setArticle(date: dateToSet)

        setTopBox()
        setBottomBox()
        view.addSubview(backgroundImage)
        view.addSubview(topBox)
        view.addSubview(bottomBox)
        setAutoLayout()

        if article?.answer == "" {
            beginAnimate()
        }
        showArticle(article: article!)
        adjustWritingMode()

        picker.delegate = self
    }

    // MARK: - AutoLayout
    private func setAutoLayout() {
        [
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            topBox.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            topBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33),
            topBox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33),
            topBox.heightAnchor.constraint(equalToConstant: 55),

            bottomBox.topAnchor.constraint(equalTo: topBox.bottomAnchor, constant: 45),
            bottomBox.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            bottomBox.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 33),
            bottomBox.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -33)

        ].forEach { $0.isActive = true }
    }

    private func setTopBox() {
        topBox.addSubview(dateLabel)
        topBox.addSubview(listBtn)
        topBox.addSubview(imgPickerBtn)
        topBox.addSubview(saveBtn)

        [
            dateLabel.topAnchor.constraint(equalTo: topBox.topAnchor, constant: 5),
            dateLabel.bottomAnchor.constraint(equalTo: topBox.bottomAnchor, constant: -5),
            dateLabel.leadingAnchor.constraint(equalTo: topBox.leadingAnchor, constant: 20),
            dateLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 128),

            listBtn.topAnchor.constraint(equalTo: topBox.topAnchor, constant: 5),
            listBtn.bottomAnchor.constraint(equalTo: topBox.bottomAnchor, constant: -5),
            listBtn.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10),
            listBtn.widthAnchor.constraint(lessThanOrEqualToConstant: 35),
            listBtn.widthAnchor.constraint(greaterThanOrEqualToConstant: 20),

            imgPickerBtn.topAnchor.constraint(equalTo: topBox.topAnchor, constant: 5),
            imgPickerBtn.bottomAnchor.constraint(equalTo: topBox.bottomAnchor, constant: -5),
            imgPickerBtn.leadingAnchor.constraint(equalTo: listBtn.trailingAnchor, constant: 10),
            imgPickerBtn.widthAnchor.constraint(lessThanOrEqualToConstant: 35),
            imgPickerBtn.widthAnchor.constraint(greaterThanOrEqualToConstant: 20),

            saveBtn.topAnchor.constraint(equalTo: topBox.topAnchor, constant: 5),
            saveBtn.bottomAnchor.constraint(equalTo: topBox.bottomAnchor, constant: -5),
            saveBtn.leadingAnchor.constraint(equalTo: imgPickerBtn.trailingAnchor, constant: 10),
            saveBtn.trailingAnchor.constraint(equalTo: topBox.trailingAnchor, constant: -10),
            saveBtn.widthAnchor.constraint(lessThanOrEqualToConstant: 35),
            saveBtn.widthAnchor.constraint(greaterThanOrEqualToConstant: 20)

        ].forEach { $0.isActive = true }

    }

    private func setBottomBox() {
        bottomBox.addSubview(questionLabel)
        bottomBox.addSubview(answerText)

        [
            questionLabel.topAnchor.constraint(equalTo: bottomBox.topAnchor, constant: 30),
            questionLabel.leadingAnchor.constraint(equalTo: bottomBox.leadingAnchor, constant: 25),
            questionLabel.trailingAnchor.constraint(equalTo: bottomBox.trailingAnchor, constant: -25),

            answerText.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 30),
            answerText.bottomAnchor.constraint(equalTo: bottomBox.bottomAnchor, constant: -30),
            answerText.leadingAnchor.constraint(equalTo: bottomBox.leadingAnchor, constant: 25),
            answerText.trailingAnchor.constraint(equalTo: bottomBox.trailingAnchor, constant: -25)

        ].forEach { $0.isActive = true }

    }

    private func setArticle(date: Date?) {
        let dateToSet: Date
        if date == nil {
            dateToSet = Date()
        } else { dateToSet = date! }
        article = sqldb.selectArticle(date: dateToSet)
    }

    private func beginAnimate() {
        bottomBox.alpha = 0
        topBox.alpha = 0
        UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: { self.bottomBox.alpha = 1 })
        UIView.animate(withDuration: 1, delay: 1.5, options: .curveEaseOut, animations: { self.topBox.alpha = 1 })
    }

    private func showArticle(article: Article) {
        dateLabel.text = dateToStr(article.date, "M월 d일")
        answerText.text = article.answer
        questionLabel.text = article.question
//        answerText.textContainerInset
//            = UIEdgeInsets(top: 20, left: 25, bottom: 20, right: 25)

//        let style: NSMutableParagraphStyle = NSMutableParagraphStyle()
//        style.lineSpacing = 10
//        let attr = [NSAttributedString.Key.paragraphStyle: style]
//        questionLabel.attributedText = NSAttributedString(string: article.question, attributes: attr)
//        answerText.attributedText = NSAttributedString(string: answerText.text, attributes: attr)
//        answerText.textColor = .white

        if article.imagePath == "" {
            backgroundImage.image = UIImage(named: "catcat0")
        } else {
            backgroundImage.image = getUIImageFromDocDir(fileName: article.imagePath)
        }
        backgroundImage.contentMode = .scaleAspectFill
    }

    private func adjustWritingMode() {
        if answerText.text.isEmpty && article!.answer.isEmpty
            && article!.imagePath == "" {
            saveBtn.setImage(UIImage(named: "to_save_gray"), for: .normal)
            saveBtn.isUserInteractionEnabled    =   false
        } else {
            saveBtn.setImage(UIImage(named: "to_save_white"), for: .normal)
            saveBtn.isUserInteractionEnabled    =   true
        }
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

    @objc func btnListTouchOn(_ sender: UIButton) {
        if answerText.text != article?.answer {
            let dataLostAlert = UIAlertController(title: "작성한 내용을 잃게되어요",
                                                  message: "그래도 계속 할까요?",
                                                  preferredStyle: .alert)
            let doAction: UIAlertAction = UIAlertAction(title: "네", style: .default) {
                _ in
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController")
                guard let listVC = vc as? ListViewController else {
                    return
                }
                listVC.modalTransitionStyle = .flipHorizontal
                listVC.modalPresentationStyle = .fullScreen
                self.present(listVC, animated: true, completion: nil)
            }
            let undoAction: UIAlertAction = UIAlertAction(title: "아니오", style: .default)
            dataLostAlert.addAction(doAction)
            dataLostAlert.addAction(undoAction)
            present(dataLostAlert, animated: true, completion: nil)
        } else {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController")
            guard let listVC = vc as? ListViewController else {
                return
            }
            listVC.modalTransitionStyle = .flipHorizontal
            listVC.modalPresentationStyle = .fullScreen
            present(listVC, animated: true, completion: nil)
        }
    }

    @objc func btnSaveTouchOn(_ sender: UIButton) {
        article!.answer = answerText.text
        if sqldb.updateArticle(article: article!) == true {
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "DisplayViewController")
            guard let displayVC = vc as? DisplayViewController else {
                return
            }
            displayVC.modalTransitionStyle = .flipHorizontal
            displayVC.modalPresentationStyle = .fullScreen
            displayVC.dateToSet = article?.date
            present(displayVC, animated: true, completion: nil)
        } else {
            print("Update Test Error!")
        }
    }

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
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

    @objc func pickImage(_ sender: Any) {
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

extension TodayViewController: UITextViewDelegate {
    func textViewDidChange(_ textViewAnswer: UITextView) {
        adjustWritingMode()
    }
}

extension TodayViewController: UIImagePickerControllerDelegate {

}

extension TodayViewController: UINavigationControllerDelegate {

}
