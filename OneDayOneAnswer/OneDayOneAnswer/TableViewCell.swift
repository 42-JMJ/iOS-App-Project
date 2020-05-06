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
    
    /*
    func addBottomBorder() {
        let thickness: CGFloat = 0.3
        let bottomBorder = CALayer()
       
        bottomBorder.frame = CGRect(x:20,
                                    y: cardView.frame.size.height - thickness,
                                    width: 310,
                                    height: thickness)
        bottomBorder.backgroundColor = UIColor.lightGray.cgColor
        cardView.layer.addSublayer(bottomBorder)
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
    
        cardView.layer.cornerRadius = 15
    }
}
