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
        label.textAlignment = .center
        label.font = UIFont(name: "DXPnMStd-Regular", size: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let questionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .natural
        label.numberOfLines = 0
        label.font = UIFont(name: "DXPnMStd-Regular", size: 14)
        label.lineBreakMode = .byWordWrapping
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let answerLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.textAlignment = .natural
        label.font = UIFont(name: "DXPnMStd-Regular", size: 17)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private func setAutoLayout() {
        [
            cardView.topAnchor.constraint(equalTo: topAnchor),
            cardView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30),
            cardView.leadingAnchor.constraint(equalTo: leadingAnchor),
            cardView.trailingAnchor.constraint(equalTo: trailingAnchor),

            dateLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            dateLabel.leadingAnchor.constraint(equalTo: cardView.leadingAnchor),
            dateLabel.widthAnchor.constraint(equalTo: cardView.widthAnchor, multiplier: 0.3),

            questionLabel.topAnchor.constraint(equalTo: cardView.topAnchor, constant: 20),
            questionLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            questionLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 20),
            questionLabel.heightAnchor.constraint(lessThanOrEqualTo: cardView.heightAnchor, multiplier: 0.3),

            answerLabel.topAnchor.constraint(equalTo: questionLabel.bottomAnchor, constant: 20),
            answerLabel.leadingAnchor.constraint(equalTo: dateLabel.trailingAnchor),
            answerLabel.trailingAnchor.constraint(equalTo: cardView.trailingAnchor, constant: 20)

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
