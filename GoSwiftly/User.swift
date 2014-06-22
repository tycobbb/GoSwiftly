//
//  User.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/3/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import CloudKit

class User : Model {
    
    override class func recordType() -> RecordType {
        return .User
    }
    
}
