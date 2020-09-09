//
//  NSFont+Extensions.swift
//  Atributika
//
//  Created by Alexandre Morgado on 09/09/20.
//  Copyright © 2020 Atributika. All rights reserved.
//

#if os(macOS)
import Cocoa

// Typealias UIFont to NSFont
public typealias UIFont = NSFont

// Add APIs that UIFont has but NSFont doesn't.
public extension NSFont {
    
//    convenience init?(named name: String) {
//        self.init(named: Name(name))
//    }
    
}
#endif
