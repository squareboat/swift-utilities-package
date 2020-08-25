//
//  Cells.swift
//  
//
//  Created by Squareboat on 24/08/20.
//

import UIKit

public protocol ReuseIdentifiable {
    static func reuseIdentifier() -> String
}

public extension ReuseIdentifiable {
    static func reuseIdentifier() -> String {
        return String(describing: self)
    }
}
