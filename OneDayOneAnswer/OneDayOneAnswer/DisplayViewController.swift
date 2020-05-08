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
    
    private var sqldb: DataBase = SqliteDataBase.instance
    private var article: Article?
    var dateToSet: Date?

    override func viewDidLoad() {
        super.viewDidLoad()

        setArticle(date: dateToSet)
        setLayerRank()
        setComponentsStyle()
        showArticle(article: article!)
//        checkDateToSet()
        adjustBottomBoxHeight()
        setLayerRank()
    }
    /*
    func checkDateToSet() {
        if dateToSet != nil {
            print(dateToStr(dateToSet!, "yyyy년 M월 d일"))
        } else {
            print("dateToSet is empty")
        }
    }
 */
    
    private func setArticle(date: Date?) {
        let setToDate: Date
        if date == nil {
            setToDate = Date()
        } else { setToDate = date! }
        article = sqldb.selectArticle(date: setToDate)
    }
    
    private func setComponentsStyle() {
        boxTop.layer.cornerRadius = 15
        boxTop.layer.masksToBounds = true
        boxBottom.layer.cornerRadius = 15
        boxBottom.layer.masksToBounds = true
        labelDate.textColor = .white
        labelQuestion.textColor = .white
        labelAnswer.textColor = .white
        btnList.setImage(UIImage(named: "to_list_white"), for: .normal)
        btnEdit.setImage(UIImage(named: "to_edit_white"), for: .normal)
        btnList.imageView?.contentMode = .scaleAspectFill
        btnEdit.imageView?.contentMode = .scaleAspectFill
        btnList.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25,
                                               bottom: 25, right: 25)
        btnEdit.imageEdgeInsets = UIEdgeInsets(top: 25, left: 25,
                                               bottom: 25, right: 25)
    }
    
    private func setLayerRank() {
        labelDate.layer.zPosition = 2
        btnList.layer.zPosition = 5
        btnEdit.layer.zPosition = 5
        labelQuestion.layer.zPosition = 2
        labelAnswer.layer.zPosition = 2
        boxTop.layer.zPosition = 1
        boxBottom.layer.zPosition = 1
        imageView.layer.zPosition = 0
    }
    
    func adjustBottomBoxHeight() {
        labelAnswer.numberOfLines = 0
        labelAnswer.textColor = .white
        labelAnswer.text = article?.answer
        /*
        labelAnswer.text = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda.Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda. \n Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
 */
        labelAnswer.sizeToFit()
        boxBottom.frame.size.height = labelAnswer.frame.size.height + 140
    }
    
    private func showArticle(article: Article) {
        labelDate.text = dateToStr(article.date, "yyyy년 M월 d일")
        labelAnswer.text = article.answer
        
        let style: NSMutableParagraphStyle = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let attr = [NSAttributedString.Key.paragraphStyle: style]
        labelQuestion.attributedText = NSAttributedString(string: article.question, attributes: attr)
        labelAnswer.attributedText = NSAttributedString(string: article.answer, attributes: attr)
        
        labelAnswer.textColor = .white
        labelAnswer.font = UIFont(name: "DXPnMStd-Regular", size: 17)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: TodayViewController = segue.destination as? TodayViewController else {
            return
        }
        nextViewController.dateToSet = article?.date
    }
}
