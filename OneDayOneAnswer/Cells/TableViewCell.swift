//
//  TableViewCell.swift
//  OneDayOneAnswer
//
//  Created by Mac on 2020. 4. 28..
//  Copyright © 2020년 JMJ. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    static let identifier = "TableViewCell"

    private let cardView: UIView = {
        let card = UIView()
        card.layer.cornerRadius = 20
        card.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.6)
        card.translatesAutoresizingMaskIntoConstraints = false
        return card
    }()
    
    let dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "DXPnMStd-Regular", size: 13)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "DXPnMStd-Regular", size: 14)
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let answerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = UIFont(name: "DXPnMStd-Regular", size: 17)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private func setAutoLayout() {
        [
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),
            cardView.heightAnchor.constraint(equalToConstant: 170),
            
            dateLabel.topAnchor.constraint(equalTo: cardView.topAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            dateLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            dateLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.3),
            dateLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 55),
            
            questionLabel.topAnchor.constraint(equalTo: cardView.topAnchor),
            questionLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            questionLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 26),

            answerLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor),
            answerLabel.bottomAnchor.constraint(equalTo: cardView.bottomAnchor),
            answerLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            answerLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor),
            answerLabel.heightAnchor.constraint(greaterThanOrEqualToConstant: 30),
            
        ].forEach { $0.isActive = true }
        
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = .clear
        tintColor = .clear
        selectedBackgroundView = {
            let view = UIView()
            view.backgroundColor = .clear
            return view
        }()
        
        cardView.addSubview(dateLabel)
        cardView.addSubview(questionLabel)
        cardView.addSubview(answerLabel)
        addSubview(cardView)
        
        setAutoLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
