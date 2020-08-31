//
//  DictionaryDecoder.swift
//  
//
//  Created by Squareboat on 31/08/20.
//

import Foundation

/// An interface to perform Dictionary Decoding
public class DictionaryDecoder {
    private let jsonDecoder = JSONDecoder()

    /// Decodes an object or an array of object from the given dictionary
    func decode<T>(_ type: T.Type, from json: [String:Any]) throws -> T where T: Decodable {
        let jsonData = try JSONSerialization.data(withJSONObject: json, options: [])
        return try jsonDecoder.decode(type, from: jsonData)
    }
}
