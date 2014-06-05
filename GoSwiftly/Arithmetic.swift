//
//  Arithmetic.swift
//  SwiftTest
//
//  Created by Ty Cobb on 6/3/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import UIKit

protocol Randomizable {
    class func random() -> Self
    class func random(range: Self?) -> Self
}

extension Int : Randomizable {
    
    static func random() -> Int {
        return random(nil)
    }
    
    static func random(range: Int?) -> Int {
        var bounds = range ? UInt32(range!) : UInt32.max;
        return Int(arc4random_uniform(bounds))
    }
    
}

extension CGFloat : Randomizable {
    
    static func random() -> CGFloat {
        return random(nil)
    }
    
    static func random(range: CGFloat?) -> CGFloat {
        var value = CGFloat(arc4random()) / CGFloat(UInt32.max)
        return value * (range ? range! : 1.0)
    }
    
}
