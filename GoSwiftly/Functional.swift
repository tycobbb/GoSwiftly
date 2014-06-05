//
//  Functional.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/4/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import Foundation

func _tap<T>(object: T, closure: (T) -> T) -> T {
    return closure(object)
}

extension String {
    func tap(closure: (String) -> String) -> String {
        return _tap(self, closure)
    }
}

extension NSObject {
    func tap(closure: (NSObject) -> NSObject) -> NSObject {
        return _tap(self, closure)
    }
}
