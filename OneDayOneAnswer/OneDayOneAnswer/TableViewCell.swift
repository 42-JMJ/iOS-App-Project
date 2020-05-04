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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cardView.layer.borderColor = UIColor.black.cgColor
        cardView.layer.borderWidth = 0.55
        cardView.layer.cornerRadius = 1
    }
}
