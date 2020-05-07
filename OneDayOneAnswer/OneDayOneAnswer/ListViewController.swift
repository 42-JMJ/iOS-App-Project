//
//  ListViewController.swift
//  OneDayOneAnswer
//
//  Created by Mihye Kim on 23/04/2020.
//  Copyright © 2020 JMJ. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var edgeLine: UIView!
    @IBOutlet var edgeLine2: UIView!
    
    var sqldb: DataBase = SqliteDataBase.instance
    var article: [Article]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.layer.cornerRadius = 20
        tableView.dataSource = self
        tableView.delegate = self
        article = sqldb.selectArticles()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let article = self.article!
        return article.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        let article = self.article!
        let count = article.count - 1
        let item = article[count - indexPath.row]
        
        cell.labelQuestion?.text = item.question
        cell.labelAnswer?.text = item.answer
        cell.labelDate?.text = dateToStr(item.date, "M월 d일")
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let article = self.article!
        let count = article.count - 1
        let item = article[count - indexPath.row]
        let today = Date()
        
        if item.date > today {
            return 0
        } else {
            return 200
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: DisplayViewController = segue.destination as? DisplayViewController else {
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        let indexPath = tableView.indexPath(for: cell)
        let article = self.article!
        let count = article.count - 1
        let item = article[count - (indexPath?.row)!]
        
        nextViewController.dateToSet = item.date
    }
 
}
