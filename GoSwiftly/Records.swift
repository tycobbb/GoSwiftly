//
//  Records.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/21/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

class Records {
    
    var _adapter : RecordAdapter!

    class var singleton : Records {
        struct Static { static let instance : Records = Records() }
        return Static.instance
    }
    
    // interface, want to extract this into an extension but compiler fails
    class var adapter : RecordAdapter! {
        get { return self.singleton._adapter }
        set { self.singleton._adapter = newValue; self.singleton._adapter.initialize() }
    }
    
}
