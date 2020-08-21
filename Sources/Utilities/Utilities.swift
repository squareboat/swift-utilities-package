//
//  Utilities.swift
//
//
//  Created by Squareboat on 20/08/20.
//

import Foundation

public class Utilities {
    
    public static let shared = Utilities()
    
    var kApplicationName = "App Name"
    
    private init() {}
    
    /// Configure the utilities with your application's name, your custom error messages and error codes
    public func configure(appName: String) {
        Utilities.shared.kApplicationName = appName
    }
}
