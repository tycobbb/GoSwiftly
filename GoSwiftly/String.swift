//
//  String.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/22/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

extension String {
    var length: Int {
        return countElements(self)
    }
    
    func pad(length: Int, padding: String = " ") -> String {
        return self.stringByPaddingToLength(length, withString: padding, startingAtIndex: 0)
    }
}
