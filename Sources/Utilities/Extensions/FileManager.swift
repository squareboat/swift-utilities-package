//
//  FileManager.swift
//  
//
//  Created by Squareboat on 24/08/20.
//

import Foundation

public extension FileManager {
    /// Helper method to get the documents directory
    ///
    /// - Returns: Path as a String of the documents directory
    class func documentsDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        return paths[0]
    }
    
    /// Helper method to get the caches directory
    ///
    /// - Returns: Path as a String of the caches directory
    class func cachesDirectory() -> String {
        let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        return paths[0]
    }
}
