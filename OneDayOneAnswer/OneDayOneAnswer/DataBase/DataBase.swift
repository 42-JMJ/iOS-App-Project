//
//  DataBase.swift
//  OneDayOneAnswer
//
//  Created by Jaedoo Ko on 2020/04/27.
//  Copyright © 2020 JMJ. All rights reserved.
//

import Foundation

struct Article {
    let id: Int
    let date: Date
    let question: String
    var answer: String = ""
    var imagePath: String = ""
}

protocol DataBase {
    static var instance: DataBase { get }
    
    func insertArticle(article: Article) -> Bool
    func insertArticles(articles: [Article]) -> Bool
    func selectArticle(date: Date) -> Article?
    func selectArticles(string: String) -> [Article]
    func selectArticles() -> [Article]
    func updateArticle(article: Article) -> Bool
    func deleteArticle(article: Article) -> Bool
    func deleteArticle(id: Int) -> Bool
    
}
