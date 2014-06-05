//
//  User.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/3/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import CloudKit

class User : Model {
   
    class func fetch(handler: FetchHandler?) {
        
        println("CONTACTS: start")
        CKDiscoverAllContactsOperation.start({ userInfos, error in
            println("CONTACTS: complete\n\tuser-infos: \(userInfos)\n\terror: \(error)")
            handler?(model: nil, error: error)
        })
    }
    
    override class func recordType() -> RecordType {
        return .User
    }
    
}
