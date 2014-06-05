//
//  Colors.swift
//  SwiftTest
//
//  Created by Ty Cobb on 6/3/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func random() -> UIColor {
        return UIColor(red: CGFloat.random(), green: CGFloat.random(), blue: CGFloat.random(), alpha: CGFloat(1.0))
    }
    
}