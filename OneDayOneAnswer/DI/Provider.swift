//
//  Provider.swift
//  OneDayOneAnswer
//
//  Created by Jaedoo Ko on 2020/06/03.
//  Copyright © 2020 JMJ. All rights reserved.
//

import Foundation

enum ProviderError: Error {
    case notFoundDependency
    case unknown

    var msg: String {
        switch self {
        case .notFoundDependency: return "not found"
        case .unknown: return "unknown error"
        }
    }
}

protocol Provider {
    var dependencies: [String: Any] { get set }

    mutating func getDependency(tag: String) throws -> Any
}

extension Provider {
    private func createDependency(tag: String) throws -> Any {
        switch tag {
        case "DataBase":
            return SqliteDataBase.instance
        default:
            throw ProviderError.notFoundDependency
        }
    }

    mutating func getDependency(tag: String) throws -> Any {
        if let object = dependencies[tag] {
            return object
        }
        guard let object = try? createDependency(tag: tag) else {
            throw ProviderError.notFoundDependency
        }
        dependencies[tag] = object
        return object
    }
}

class DependencyProvider: Provider {
    var dependencies: [String: Any] = [:]
}
