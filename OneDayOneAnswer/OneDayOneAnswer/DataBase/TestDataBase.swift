//
//  TestDB.swift
//  OneDayOneAnswer
//
//  Created by Jaedoo Ko on 2020/04/27.
//  Copyright © 2020 JMJ. All rights reserved.
//


import Foundation

class TestDataBase: DataBase {
    static let instance: DataBase = TestDataBase()
    
    private var db: [Article]
    private var index: Int
    
    private init() {
        db = []
        index = 0
        if self.insertArticles(articles: [Article(id: 0, date: Date(), question: "안녕?", answer: "", imagePath: ""),
            Article(id: 1, date: Date(), question: "끝?", answer: "", imagePath: "")]) {
            print("Test Database OK")
        } else {
            print("Test Database Error")
        }
    }
    
    func insertArticle(article: Article) -> Bool {
        self.index += 1
        let new: Article = Article(id: self.index, date: article.date, question: article.question, answer: article.answer, imagePath: "")
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
    
    func selectArticle(date: Date) -> Article? {
        let index: Int = Int(arc4random_uniform(UInt32(db.count)))
        return db[index]
    }
    
    func selectArticles(string: String) -> [Article] {
        return db
    }
    
    func selectArticles() -> [Article] {
        return db
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
