//
//  FileUtils.swift
//  OneDayOneAnswer
//
//  Created by Jaedoo Ko on 2020/05/04.
//  Copyright © 2020 JMJ. All rights reserved.
//

import Foundation
import UIKit

func getUIImageFromDocDir(fileName: String) -> UIImage? {
    guard let fileURL: URL = try? FileManager.default
        .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent(fileName) else {
        print("image loading fail")
        return nil
    }
    let image: UIImage? = UIImage(contentsOfFile: fileURL.path)
    return image
}

func getUIImageFromBundle(fileName: String, fileExtension: String) -> UIImage? {
    guard let fileURL: URL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
        print("file not found")
        return nil
    }
    let image: UIImage? = UIImage(contentsOfFile: fileURL.path)
    return image
}

func getFileStringFromBundle(fileName: String, fileExtension: String) -> String? {
    guard let fileURL: URL = Bundle.main.url(forResource: fileName, withExtension: fileExtension) else {
        print("file not found")
        return nil
    }
    guard let str: String = try? String.init(contentsOf: fileURL) else {
        print("file could not be read")
        return nil
    }
    return str
}
