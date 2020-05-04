//
//  Sqlite.swift
//  OneDayOneAnswer
//
//  Created by Jaedoo Ko on 2020/04/28.
//  Copyright © 2020 JMJ. All rights reserved.
//

import Foundation
import SQLite3

class SqliteDataBase: DataBase {
    static let instance: DataBase = SqliteDataBase()
    
    static let dbName: String = "db.sqlite"
    static let tableName: String = "article"
    
    private var sqlite: OpaquePointer?
    
    private init() {
        guard openSqlite3() else {
            print("database error")
            return
        }
        if tableExists() {
            return
        }
        guard createTable() else {
            print("database table error")
            return
        }
        guard initTable() else {
            print("table init error")
            return
        }
    }
    
    deinit {
        guard sqlite3_close_v2(self.sqlite) == SQLITE_OK else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print(errmsg)
            return
        }
        self.sqlite = nil
    }
    
    private func openSqlite3() -> Bool {
        let fileURL = try! FileManager.default
            .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            .appendingPathComponent(SqliteDataBase.dbName)
        guard sqlite3_open(fileURL.path, &sqlite) == SQLITE_OK else {
            return false
        }
        return true
    }
    
    private func tableExists() -> Bool {
        let query: String = "SELECT * FROM sqlite_master WHERE type='table' AND name='\(SqliteDataBase.tableName)'"
        var statement: OpaquePointer?
        
        defer {
            sqlite3_finalize(statement)
        }
        
        guard sqlite3_prepare_v2(self.sqlite, query, -1, &statement, nil) == SQLITE_OK else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print(errmsg)
            return false
        }
        
        guard sqlite3_step(statement) == SQLITE_ROW else {
            return false
        }
        
        return true
    }
    
    private func initTable() -> Bool {
        guard let contents: String = getFileStringFromBundle(fileName: "42-JMJ-Question", fileExtension: "tsv") else {
            print("question read error")
            return false
        }
        var questions: [String] = []
        for (index, str) in contents.split(separator: "\t")[3...].enumerated() {
            if index % 2 == 0 {
                questions.append(String(str))
            }
        }
        
        var date: Date = Date()
        let interval: TimeInterval = 60 * 60 * 24
        for str in questions {
            let article = Article(id: -1, date: date, question: str, answer: "")
            guard insertArticle(article: article) else {
                return false
            }
            date += interval
        }
        
        return true
    }
    
    private func createTable() -> Bool {
        let query: String = "CREATE TABLE IF NOT EXISTS \(SqliteDataBase.tableName) (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, question TEXT, answer TEXT)"
        guard sqlite3_exec(self.sqlite, query, nil, nil, nil) == SQLITE_OK else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print("\(errmsg)")
            return false
        }
        return true
    }
    
    func insertArticle(article: Article) -> Bool {
        let query: String = "INSERT INTO \(SqliteDataBase.tableName) (date, question, answer) values (date(?), ?, ?)"
        var statement: OpaquePointer?
        
        defer {
            sqlite3_finalize(statement)
        }
        
        guard sqlite3_prepare_v2(self.sqlite, query, -1, &statement, nil) == SQLITE_OK else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print(errmsg)
            return false
        }
        sqlite3_bind_text(statement, 1, dateToStr(article.date, "yyyy-MM-dd HH:mm:ss"), -1, nil)
        sqlite3_bind_text(statement, 2, article.question, -1, nil)
        sqlite3_bind_text(statement, 3, article.answer, -1, nil)
        guard sqlite3_step(statement) == SQLITE_DONE else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print(errmsg)
            return false
        }
        return true
    }
    
    func insertArticles(articles: [Article]) -> Bool {
        var result: Bool = true
        for article in articles {
            result = result && insertArticle(article: article)
        }
        return result
    }
    
    private func getArticleFromStatement(statement: OpaquePointer?) -> Article? {
        let id: Int = Int(sqlite3_column_int(statement, 0))
        let question: String = String(cString: sqlite3_column_text(statement, 2))
        let answer: String = String(cString: sqlite3_column_text(statement, 3))
        guard let date: Date = strToDate(String(cString: sqlite3_column_text(statement, 1))) else {
            print("strToDate fail")
            return nil
        }
        return Article(id: id, date: date, question: question, answer: answer)
    }
    
    func selectArticle(date: Date) -> Article? {
        let query: String = "SELECT * FROM \(SqliteDataBase.tableName) WHERE date = date(?)"
        var statement: OpaquePointer?
        
        defer {
            sqlite3_finalize(statement)
        }
        
        guard sqlite3_prepare_v2(self.sqlite, query, -1, &statement, nil) == SQLITE_OK else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite))
            print(errmsg)
            return nil
        }
        
        sqlite3_bind_text(statement, 1, dateToStr(date), -1, nil)
        
        guard sqlite3_step(statement) == SQLITE_ROW else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite))
            print(errmsg)
            return nil
        }
        
        return getArticleFromStatement(statement: statement)
    }
    
    func selectArticles(string: String) -> [Article] {
        return []
    }
    
    func selectArticles() -> [Article] {
        let query: String = "SELECT * FROM \(SqliteDataBase.tableName)"
        var statement: OpaquePointer?
        
        defer {
            sqlite3_finalize(statement)
        }
        
        guard sqlite3_prepare_v2(self.sqlite, query, -1, &statement, nil) == SQLITE_OK else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print(errmsg)
            return []
        }
        
        var articles: [Article] = []
        while sqlite3_step(statement) == SQLITE_ROW {
            if let article = getArticleFromStatement(statement: statement) {
                articles.append(article)
            }
        }
        return articles
    }
    
    func updateArticle(article: Article) -> Bool {
        let query: String = "UPDATE \(SqliteDataBase.tableName) SET answer = ? WHERE id = ?"
        var statement: OpaquePointer?
        
        defer {
            sqlite3_finalize(statement)
        }
        
        guard sqlite3_prepare_v2(self.sqlite, query, -1, &statement, nil) == SQLITE_OK else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print(errmsg)
            return false
        }
        
        sqlite3_bind_text(statement, 1, article.answer, -1, nil)
        sqlite3_bind_int(statement, 2, Int32(article.id))
        
        guard sqlite3_step(statement) == SQLITE_DONE else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print(errmsg)
            return false
        }
        
        return true
    }
    
    func deleteArticle(id: Int) -> Bool {
        return false
    }
    
    func deleteArticle(article: Article) -> Bool {
        return false
    }
}
