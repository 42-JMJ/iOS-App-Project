//
//  TableViewCell.swift
//  OneDayOneAnswer
//
//  Created by Mac on 2020. 4. 28..
//  Copyright © 2020년 JMJ. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelQuestion: UILabel!
    @IBOutlet weak var labelAnswer: UILabel!
    
    func setDateAndArticle(date: Date?) {
        let today: Date
        if date == nil {
            today = Date()
        } else {
            today = date!
        }
        let formatter           =   DateFormatter()
        formatter.dateFormat    =   "MM월 dd일"
        labelDate.textAlignment =   .center
        labelDate.text          =   String(formatter.string(from: today))
        
        let db: DataBase = TestDataBase.instance
        labelQuestion.text = db.selectArticle(date: today)?.question
        labelAnswer.text = db.selectArticle(date: today)?.answer
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setDateAndArticle(date: nil)
    }
}
