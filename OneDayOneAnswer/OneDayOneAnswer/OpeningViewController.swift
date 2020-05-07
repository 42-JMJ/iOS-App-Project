//
//  OpeningViewController.swift
//  OneDayOneAnswer
//
//  Created by Mac on 2020. 5. 7..
//  Copyright © 2020년 JMJ. All rights reserved.
//

import UIKit

class OpeningViewController: UIViewController {

    @IBOutlet weak var viewBackground: UIView!
    @IBOutlet weak var viewLine: UIView!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    
    
    var sqldb: DataBase = SqliteDataBase.instance
    var article: Article?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLabel()
        drawLine()
    }
    
    func drawLine() {
        viewLine.layer.borderWidth = 1.0
        viewLine.layer.borderColor = UIColor.white.cgColor
    }
    
    func getTodayQuestion(date: Date?) -> String? {
        article = sqldb.selectArticle(date: date!)
        return article?.question
    }
    
    func setLabel() {
        let today: Date? = Date()
        
        labelQuestion.text = getTodayQuestion(date: today!)
        labelDate.text = dateToStr(today!, "M월 d일")
        
        labelQuestion.numberOfLines = 3
        labelQuestion.textColor = .white
        labelQuestion.textAlignment = .center
        labelQuestion.sizeToFit()
        
    }

}
