//
//  Message.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/3/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import CloudKit

class Message : Model {
    
    var text : String?
    
    init(text: String) {
        self.text = text
        super.init()
    }
    
    override class func recordType() -> RecordType {
        return .Message
    }
    
}
