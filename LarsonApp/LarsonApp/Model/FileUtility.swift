//
//  FileUtility.swift
//  LarsonApp
//
//  Created by Jian Zhang on 11/7/16.
//  Copyright © 2016 Jian Zhang. All rights reserved.
//

import UIKit

class FileUtility: NSObject {
    static func getFilePath(filePath: String) -> String? {
        
        var paths = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.cachesDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true)
        if paths.count > 0 {
            return "\(paths[0])/"+filePath
        }
        
        return nil
    }
    //MARK: 归档的方法
    static func archive(fileName: String, object: NSObject) -> Bool {
        let name = getFilePath(filePath: fileName)!
        return NSKeyedArchiver.archiveRootObject(object, toFile: name )
    }
    //MARK: 解档的方法
    static func unarchive(fileName: String) -> AnyObject? {
        return NSKeyedUnarchiver.unarchiveObject(withFile: getFilePath(filePath: fileName)!) as AnyObject?
    }
}
