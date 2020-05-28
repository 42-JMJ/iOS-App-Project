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
        adjustBottomBoxHeight()
        setLayerRank()
    }
    
    private func setArticle(date: Date?) {
        let dateToSet: Date
        if date == nil {
            dateToSet = Date()
        } else { dateToSet = date! }
        article = sqldb.selectArticle(date: dateToSet)
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
        labelAnswer.sizeToFit()
    }
    
    private func showArticle(article: Article) {
        labelDate.text = dateToStr(article.date, "M월 d일")
        labelAnswer.text = article.answer
        
        let style: NSMutableParagraphStyle = NSMutableParagraphStyle()
        style.lineSpacing = 10
        let attr = [NSAttributedString.Key.paragraphStyle: style]
        labelQuestion.attributedText = NSAttributedString(string: article.question, attributes: attr)
        labelAnswer.attributedText = NSAttributedString(string: article.answer, attributes: attr)
        
        labelAnswer.textColor = .white
        labelAnswer.font = UIFont(name: "DXPnMStd-Regular", size: 17)
        
        if article.imagePath == "" {
            imageView.image = UIImage(named: "catcat0")
        } else {
            imageView.image = getUIImageFromDocDir(fileName: article.imagePath)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: TodayViewController = segue.destination as? TodayViewController else {
            return
        }
        nextViewController.dateToSet = article?.date
    }
}
