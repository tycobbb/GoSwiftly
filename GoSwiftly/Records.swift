//
//  Records.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/21/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

class Records {
    
    var adapater : RecordAdapter!

    class var singleton : Records {
        struct Static {
            static let instance : Records = Records()
        }
        return Static.instance
    }
    
    class var adapter : RecordAdapter! {
        return self.singleton.adapater
    }
    
}
