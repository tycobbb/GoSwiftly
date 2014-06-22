//
//  Functional.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/4/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import Foundation

func dispatch_after_seconds(seconds: NSTimeInterval, block: dispatch_block_t?) {
    dispatch_after(dispatch_time(0, Int64(seconds * 1000000000)), dispatch_get_main_queue(), block)
}

func _tap<T>(object: T, closure: (T) -> T) -> T {
    return closure(object)
}

extension String {
    func tap(closure: (String) -> String) -> String {
        return _tap(self, closure)
    }
}
