//
//  ListViewController.swift
//  OneDayOneAnswer
//
//  Created by Mihye Kim on 23/04/2020.
//  Copyright © 2020 JMJ. All rights reserved.
//

import UIKit

class ListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var sqldb: DataBase = SqliteDataBase.instance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let article = sqldb.selectArticles()
        
        return article.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        let article = sqldb.selectArticles()
        let item = article[indexPath.row]
        
        cell.labelQuestion?.text = item.question
        cell.labelAnswer?.text = item.answer
        cell.labelDate?.text = dateToStr(item.date, "M월 d일")
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let article = sqldb.selectArticles()
        let item = article[indexPath.row]
        let today = Date()
        
        if item.date > today {
            return 0
        } else {
            return 200
        }
    }
    
    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let nextViewController: TodayViewController = segue.destination as? TodayViewController else{
            return
        }
        guard let cell: UITableViewCell = sender as? UITableViewCell else {
            return
        }
        
        let indexPath = tableView.indexPath(for: cell)
        let article = sqldb.selectArticles()
        let item = article[(indexPath?.row)!]
        
        nextViewController.textToSet = item.date
    }
    */
}
