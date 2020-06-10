//
//  ListViewController.swift
//  OneDayOneAnswer
//
//  Created by Mihye Kim on 23/04/2020.
//  Copyright © 2020 JMJ. All rights reserved.
//

import UIKit

class ListViewController: BaseViewController {

    private let backgroundImage: UIImageView = {
        let iv = UIImageView()
        let image = UIImage(imageLiteralResourceName: "catcat0")
        iv.image = image
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private lazy var tableView: UITableView = {
        let tv = UITableView()
        tv.dataSource = self
        tv.delegate = self
        tv.backgroundColor = .clear
        tv.showsVerticalScrollIndicator = false
        tv.register(TableViewCell.self, forCellReuseIdentifier: TableViewCell.identifier)
        tv.translatesAutoresizingMaskIntoConstraints = false
        return tv
    }()

    private let lable: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.text = "나의 기록"
        lb.textColor = .white
        lb.font = UIFont(name: "DXPnMStd-Regular", size: 22)
        return lb
    }()

    private var sqldb: DataBase?
    private var article: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        setAutoLayout()

        let today = Date()
        if let article = sqldb?.selectArticles() {
            self.article =  article.filter { $0.date < today }
        }
    }

    override func provideDependency() {
        super.provideDependency()
        if let db = try? provider?.getDependency(tag: "DataBase") as? DataBase {
            self.sqldb = db
        } else {
            print("err")
        }
    }

    private func setAutoLayout() {
        view.addSubview(backgroundImage)
        view.addSubview(lable)
        view.addSubview(tableView)

        backgroundImage.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        backgroundImage.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        backgroundImage.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        lable.heightAnchor.constraint(equalToConstant: 30).isActive = true
        lable.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40).isActive = true
        lable.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        tableView.topAnchor.constraint(equalTo: lable.bottomAnchor, constant: 30).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 33).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -33).isActive = true
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: DisplayViewController = segue.destination as? DisplayViewController else {
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        let indexPath = tableView.indexPath(for: cell)
        let count = article.count - 1
        let item = article[count - (indexPath?.row)!]

        nextViewController.dateToSet = item.date
        nextViewController.provider = provider
    }

}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return article.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier, for: indexPath)
        guard let tvCell = cell as? TableViewCell else {
            return cell
        }

        let item = article[article.count - indexPath.row - 1]

        tvCell.questionLabel.text = item.question
        tvCell.answerLabel.text = item.answer
        tvCell.dateLabel.text = dateToStr(item.date, "M월 d일")
        return tvCell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
}

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let count = article.count - 1
        let item = article[count - (indexPath.row)]

        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DisplayViewController")
        guard let todayVC = vc as? DisplayViewController else {
            return
        }
        todayVC.modalTransitionStyle = .flipHorizontal
        todayVC.modalPresentationStyle = .fullScreen
        todayVC.dateToSet = item.date
        todayVC.provider = provider
        present(todayVC, animated: true, completion: nil)
    }

}
