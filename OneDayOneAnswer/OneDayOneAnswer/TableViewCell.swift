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
    
    func addSpacingBtwEachLines() {

        let attrString = NSMutableAttributedString(string: labelQuestion.text!)
        let paragraphStyle = NSMutableParagraphStyle()
        
        paragraphStyle.lineSpacing = 10
        attrString.addAttribute(NSAttributedString.Key.paragraphStyle, value: paragraphStyle, range: NSMakeRange(0, attrString.length))
        labelQuestion.attributedText = attrString
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    
        addBottomBorder()
        addSpacingBtwEachLines()
    }
}
