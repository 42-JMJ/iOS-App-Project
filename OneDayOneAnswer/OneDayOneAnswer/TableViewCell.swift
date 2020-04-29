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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        
        //cardView.layer.borderWidth = 0.25
        //cardView.layer.borderColor = UIColor.darkGray.cgColor
        //cardView.layer.cornerRadius = 20
    }
 

}
