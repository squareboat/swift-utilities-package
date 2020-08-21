//
//  JSONUtils.swift
//  
//
//  Created by Squareboat on 20/08/20.
//

import Foundation

public class JSONUtils {
    /// Converts a string response to a human readable dictionary
    public class func convertToDictionary(text: String) -> [String: Any]? {
        if let data = text.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
    
    /// Converts a given dictionary to pretty printed string
    public class func convertToString(dictionary : Any) -> String? {
        guard let data = try? JSONSerialization.data(withJSONObject: dictionary, options: [.prettyPrinted]) else {
            return nil
        }
        return String(data: data, encoding: String.Encoding.utf8)
    }
    
    /// Returns JSON data from an Array Response
    public class func getJsonStringFromArrayResponse(response: NSArray) -> Data? {
        let theJSONData = try? JSONSerialization.data(
            withJSONObject: response,
            options: [])
        let theJSONText = String(data: theJSONData!,
                                 encoding: .utf8)
        return theJSONText!.data(using: .utf8)
    }
    
    /// Returns JSON data from a Dictionary Response
    class func getJsonStringFromDictResponse(response: NSDictionary) -> Data? {
        let theJSONData = try? JSONSerialization.data(
            withJSONObject: response,
            options: [])
        let theJSONText = String(data: theJSONData!,
                                 encoding: .utf8)
        return theJSONText!.data(using: .utf8)
    }
}
