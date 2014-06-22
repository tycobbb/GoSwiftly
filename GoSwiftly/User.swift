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
        
        CKContainer.defaultContainer().discoverAllContactUserInfosWithCompletionHandler {
            responseInfos, error in
            
            println("contacts")
            let userInfos = responseInfos as CKDiscoveredUserInfo[]
            let users = userInfos.map({
                userInfo -> CKDiscoveredUserInfo in
                println("\t\(userInfo.firstName) \(userInfo.lastName)")
                return userInfo
            })
            println("\n")

        }
        
    }
    
    override class func recordType() -> RecordType {
        return .User
    }
    
}
