//
//  Collections.swift
//  SwiftTest
//
//  Created by Ty Cobb on 6/3/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import Foundation

extension Array {
    
    func random() -> T {
        var index = Int.random(self.count)
        return self[index]
    }
    
    func sample(var size: Int) -> T[] {
        var sample = Array<T>()
    
        while(size-- != 0) {
            sample.append(self.random())
        }
    
        return sample
    }
        
}
