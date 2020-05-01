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
        guard createTable() else {
            print("database table error")
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
            .appendingPathComponent(Self.dbName)
        guard sqlite3_open(fileURL.path, &sqlite) == SQLITE_OK else {
            return false
        }
        return true
    }
    
    private func initTable() -> Bool {
        // 처음 디비 테이블이 생성됐을 때 만들어 놓은 질문들을 삽입
        return false
    }
    
    private func createTable() -> Bool {
        let query: String = "CREATE TABLE IF NOT EXISTS \(Self.tableName) (id INTEGER PRIMARY KEY AUTOINCREMENT, date TEXT, question TEXT, answer TEXT)"
        guard sqlite3_exec(self.sqlite, query, nil, nil, nil) == SQLITE_OK else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print("\(errmsg)")
            return false
        }
        return true
    }
    
    func insertArticle(article: Article) -> Bool {
        let query: String = "INSERT INTO \(Self.tableName) (date, question, answer) values (?, ?, ?)"
        var statement: OpaquePointer?
        
        defer {
            sqlite3_finalize(statement)
        }
        
        guard sqlite3_prepare_v2(self.sqlite, query, -1, &statement, nil) == SQLITE_OK else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print(errmsg)
            return false
        }
        sqlite3_bind_text(statement, 1, "2020-04-30", -1, nil)
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
        return false
    }
    
    func selectArticle(date: Date) -> Article? {
        let query: String = "SELECT * FROM \(Self.tableName) WHERE date(date) = date(?)"
        var statement: OpaquePointer?
        
        defer {
            sqlite3_finalize(statement)
        }
        
        guard sqlite3_prepare_v2(self.sqlite, query, -1, &statement, nil) == SQLITE_OK else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite))
            print(errmsg)
            return nil
        }
        sqlite3_bind_text(statement, 1, "", -1, nil)
        guard sqlite3_step(statement) == SQLITE_ROW else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite))
            print(errmsg)
            return nil
        }
        let id: Int = Int(sqlite3_column_int(statement, 0))
        guard let date: Date = strToDate(String(cString: sqlite3_column_text(statement, 1)!)) else {
            print("strToDate fail")
            return nil
        }
        let question: String = String(cString: sqlite3_column_text(statement, 2))
        let answer: String = String(cString: sqlite3_column_text(statement, 3))
        return Article(id: id, date: date, question: question, answer: answer)
    }
    
    func selectArticles(string: String) -> [Article] {
        return []
    }
    
    func selectArticles() -> [Article] {
        let query: String = "SELECT * FROM \(Self.tableName)"
        var statement: OpaquePointer?
        
        defer {
            sqlite3_finalize(statement)
        }
        
        guard sqlite3_prepare_v2(self.sqlite, query, -1, &statement, nil) == SQLITE_OK else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print(errmsg)
            return []
        }
        
        guard sqlite3_step(statement) == SQLITE_ROW else {
            let errmsg: String = String(cString: sqlite3_errmsg(self.sqlite)!)
            print(errmsg)
            return []
        }
        let article: Article = Article(id: Int(sqlite3_column_int(statement, 0)),
                                       date: Date(),
                                       question: String(cString: sqlite3_column_text(statement, 2)),
                                       answer: String(cString: sqlite3_column_text(statement, 3)))
        return [article]
    }
    
    func updateArticle(article: Article) -> Bool {
        return false
    }
    
    func deleteArticle(id: Int) -> Bool {
        return false
    }
    
    func deleteArticle(article: Article) -> Bool {
        return false
    }
}
