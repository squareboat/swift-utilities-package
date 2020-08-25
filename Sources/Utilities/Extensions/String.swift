//
//  String.swift
//  
//
//  Created by Squareboat on 21/08/20.
//

import Foundation

public extension String {
    /// Get NSAttributed String from an HTML String
    ///
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return nil }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return nil
        }
    }
    
    /// Get String from an HTML String
    ///
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
    
    /// Get number of words in a string
    ///
    var wordCount: Int {
        
        let regex = try? NSRegularExpression(pattern: "\\w+")
        return regex?.numberOfMatches(in: self, range: NSRange(location: 0, length: self.utf16.count)) ?? 0
    }
}

