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

    private let backgroundImage: UIImageView = {
        let imgView = UIImageView()
        imgView.translatesAutoresizingMaskIntoConstraints = false
        return imgView
    }()

    private let scrollView: UIScrollView = {
        let sv = UIScrollView()
        sv.contentMode = .scaleToFill
        sv.backgroundColor = .clear
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()

    private let scrollContentView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
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
        btn.addTarget(self, action: #selector(listBtnTouchOn), for: .touchDown)
        return btn
    }()

    private lazy var editBtn: UIButton = {
        let btn = UIButton()
        btn.setImage(UIImage(named: "to_edit_white"), for: .normal)
        btn.imageView?.contentMode = .scaleAspectFit
        btn.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(editBtnTouchOn), for: .touchDown)
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

    private let answerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "DXPnMStd-Regular", size: 17)
        label.backgroundColor = .clear
        label.numberOfLines = 0
        label.textAlignment = .natural
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private var sqldb: DataBase = SqliteDataBase.instance
    private var article: Article?
    var dateToSet: Date?

    override func viewDidLoad() {
        super.viewDidLoad()

        setArticle(date: dateToSet)
        showArticle(article: article!)

        setAutoLayout()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.contentSize.height = scrollContentView.frame.height
    }

    // MARK: - AutoLayout
    private func setAutoLayout() {
        setScrollView()

        view.addSubview(backgroundImage)
        view.addSubview(scrollView)

        [
            backgroundImage.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),

            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor)

        ].forEach { $0.isActive = true }
    }

    private func setScrollView() {
        setTopBox()
        setBottomBox()

        scrollContentView.addSubview(topBox)
        scrollContentView.addSubview(bottomBox)
        scrollView.addSubview(scrollContentView)

        [

            topBox.topAnchor.constraint(equalTo: scrollContentView.topAnchor, constant: 40),
            topBox.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 33),
            topBox.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -33),
            topBox.heightAnchor.constraint(equalToConstant: 55),

            bottomBox.topAnchor.constraint(equalTo: topBox.bottomAnchor, constant: 45),
            bottomBox.bottomAnchor.constraint(equalTo: answerLabel.bottomAnchor, constant: 30),
            bottomBox.leadingAnchor.constraint(equalTo: scrollContentView.leadingAnchor, constant: 33),
            bottomBox.trailingAnchor.constraint(equalTo: scrollContentView.trailingAnchor, constant: -33),

            scrollContentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollContentView.bottomAnchor.constraint(equalTo: bottomBox.bottomAnchor, constant: 30),
            scrollContentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollContentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollContentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)

        ].forEach { $0.isActive = true }
    }

    private func setTopBox() {
        topBox.addSubview(dateLabel)
        topBox.addSubview(listBtn)
        topBox.addSubview(editBtn)

        [
            dateLabel.topAnchor.constraint(equalTo: topBox.topAnchor, constant: 5),
            dateLabel.bottomAnchor.constraint(equalTo: topBox.bottomAnchor, constant: -5),
            dateLabel.leadingAnchor.constraint(equalTo: topBox.leadingAnchor, constant: 20),
            dateLabel.widthAnchor.constraint(greaterThanOrEqualToConstant: 100),

            listBtn.topAnchor.constraint(equalTo: topBox.topAnchor, constant: 5),
            listBtn.bottomAnchor.constraint(equalTo: topBox.bottomAnchor, constant: -5),
            listBtn.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor, constant: 10),
            listBtn.widthAnchor.constraint(lessThanOrEqualToConstant: 35),
            listBtn.widthAnchor.constraint(greaterThanOrEqualToConstant: 20),

            editBtn.topAnchor.constraint(equalTo: topBox.topAnchor, constant: 5),
            editBtn.bottomAnchor.constraint(equalTo: topBox.bottomAnchor, constant: -5),
            editBtn.leadingAnchor.constraint(equalTo: listBtn.trailingAnchor, constant: 10),
            editBtn.trailingAnchor.constraint(equalTo: topBox.trailingAnchor, constant: -10),
            editBtn.widthAnchor.constraint(lessThanOrEqualToConstant: 35),
            editBtn.widthAnchor.constraint(greaterThanOrEqualToConstant: 20)

        ].forEach { $0.isActive = true }

    }

    private func setBottomBox() {
        bottomBox.addSubview(questionLabel)
        bottomBox.addSubview(answerLabel)

        [
            questionLabel.topAnchor.constraint(equalTo: bottomBox.topAnchor, constant: 30),
            questionLabel.leadingAnchor.constraint(equalTo: bottomBox.leadingAnchor, constant: 25),
            questionLabel.trailingAnchor.constraint(equalTo: bottomBox.trailingAnchor, constant: -25),

            answerLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 30),
            answerLabel.leadingAnchor.constraint(equalTo: bottomBox.leadingAnchor, constant: 25),
            answerLabel.trailingAnchor.constraint(equalTo: bottomBox.trailingAnchor, constant: -25)

        ].forEach { $0.isActive = true }

    }

    private func setArticle(date: Date?) {
        let dateToSet: Date
        if date == nil {
            dateToSet = Date()
        } else { dateToSet = date! }
        article = sqldb.selectArticle(date: dateToSet)
    }

    private func showArticle(article: Article) {
        dateLabel.text = dateToStr(article.date, "M월 d일")
        answerLabel.text = article.answer

        let style: NSMutableParagraphStyle = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let attr = [NSAttributedString.Key.paragraphStyle: style]
        questionLabel.attributedText = NSAttributedString(string: article.question, attributes: attr)
        answerLabel.attributedText = NSAttributedString(string: article.answer, attributes: attr)

        if article.imagePath == "" {
            backgroundImage.image = UIImage(named: "catcat0")
        } else {
            backgroundImage.image = getUIImageFromDocDir(fileName: article.imagePath)
        }
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: TodayViewController = segue.destination as? TodayViewController else {
            return
        }
        nextViewController.dateToSet = article?.date
    }

    @objc func listBtnTouchOn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "ListViewController")
        guard let listVC = vc as? ListViewController else {
            return
        }
        listVC.modalTransitionStyle = .flipHorizontal
        listVC.modalPresentationStyle = .fullScreen
        present(listVC, animated: true, completion: nil)
    }

    @objc func editBtnTouchOn(_ sender: UIButton) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "TodayViewController")
        guard let todayVC = vc as? TodayViewController else {
            return
        }
        todayVC.dateToSet = article?.date
        todayVC.modalTransitionStyle = .flipHorizontal
        todayVC.modalPresentationStyle = .fullScreen
        present(todayVC, animated: true, completion: nil)
    }
}
