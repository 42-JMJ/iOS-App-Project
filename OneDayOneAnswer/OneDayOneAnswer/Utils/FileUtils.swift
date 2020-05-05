//
//  FileUtils.swift
//  OneDayOneAnswer
//
//  Created by Jaedoo Ko on 2020/05/04.
//  Copyright © 2020 JMJ. All rights reserved.
//

import Foundation
import UIKit

func getUniqueFileName() -> String {
    return "\(ProcessInfo.processInfo.globallyUniqueString).jpeg"
}

func saveUIImageToDocDir(image: UIImage) -> String? {
    guard let data: Data = image.jpegData(compressionQuality: 1) else {
        print("image converting fail")
        return nil
    }
    
    guard var url: URL = try? FileManager.default
        .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("ODOA_img", isDirectory: true) else {
        
            print("fileURL error")
            return nil
    }
    if !FileManager.default.fileExists(atPath: url.path) {
        do {
            try FileManager.default.createDirectory(at: url, withIntermediateDirectories: true, attributes: nil)
        } catch let err {
            print(err)
            return nil
        }
    }
    
    url.appendPathComponent(getUniqueFileName())
    
    do {
        try data.write(to: url)
        return url.lastPathComponent
    } catch let err {
        print(err)
        return nil
    }
}

func getUIImageFromDocDir(fileName: String) -> UIImage? {
    guard let fileURL: URL = try? FileManager.default
        .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
        .appendingPathComponent("ODOA_img", isDirectory: true)
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

func getFileContentsFromBundle(fileName: String, fileExtension: String) -> String? {
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
