//
//  DictionaryEncoder.swift
//  
//
//  Created by Squareboat on 31/08/20.
//

import Foundation

/// An interface to perform Dictionary Encoding
public class DictionaryEncoder {
    private let jsonEncoder = JSONEncoder()

    /// Encodes given Encodable value into a dictionary
    func encode<T>(_ value: T) throws -> [String:Any] where T: Encodable {
        let data = try JSONEncoder().encode(value)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else { throw NSError() }
        return dictionary
    }
}
