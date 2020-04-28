//
//  TestDB.swift
//  OneDayOneAnswer
//
//  Created by Jaedoo Ko on 2020/04/27.
//  Copyright © 2020 JMJ. All rights reserved.
//

import Foundation

class TestDB: DataBase {
    static let data: DataBase = TestDB()
    
    private var db: [Article]
    private var index: Int
    
    private init() {
        db = []
        index = 0
        db.append(contentsOf: [Article(id: 0, date: Date(), question: "안녕?", answer: ""),
                               Article(id: 1, date: Date(), question: "끝?", answer: "")])
    }
    
    func insertArticle(article: Article) -> Bool {
        self.index += 1
        let new: Article = Article(id: self.index, date: article.date, question: article.question, answer: article.answer)
        db.append(new)
        return true
    }
    
    func insertArticles(articles: [Article]) -> Bool {
        let results: [Bool] = articles.map(self.insertArticle)
        var result: Bool = true
        for temp in results {
            result = result && temp
        }
        return result
    }
    
    func selectArticle(date: Date) -> Article {
        let index: Int = Int(arc4random_uniform(UInt32(db.count)))
        return db[index]
    }
    
    func selectArticle(string: String) -> [Article] {
        db
    }
    
    func updateArticle(article: Article) -> Bool {
        db[article.id] = article
        return true
    }
    
    func deleteArticle(id: Int) -> Bool {
        db.remove(at: id)
        return true
    }
    
    func deleteArticle(article: Article) -> Bool {
        db.removeAll()
        return true
    }
}
