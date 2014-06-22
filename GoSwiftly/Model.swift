//
//  Model.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/3/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import UIKit
import CloudKit

typealias FetchHandler     = (model: Model[]?, error: NSError?) -> Void
typealias CreateHandler    = (model: Model[]?, error: NSError?) -> Void
typealias SubscribeHandler = (subscriptionID: String?, error: NSError?) -> Void

@objc protocol AbstractModel {
    @optional class func fetch(handler: FetchHandler?)
}

class Model : NSObject, AbstractModel {
    
    class func insert(attributes: Dictionary<String, AnyObject>? = nil, handler: CreateHandler?) {
        // insert a new record
        Records.adapter.insert(self.recordType().toRaw(), attributes: attributes, handler:{
            record, error in
            // callback the handler with the generated model
            if let validHandler = handler {
                validHandler(model: nil, error: error)
            }
        })
    }
    
    class func subscribe(predicate: NSPredicate? = NSPredicate(value: true), handler: SubscribeHandler? = nil) -> String! {
        // create a new subscription
        return Records.adapter.subcribe(self.recordType().toRaw(), predicate: predicate, handler: {
            subscription, error in
            if let validHandler = handler {
                validHandler(subscriptionID: "dummy", error: error)
            }
        })
    }
    
    class func unsubscribe(subscriptionID: String, handler: SubscribeHandler? = nil) {
        // remove an existing subscription
        Records.adapter.unsubscribe(subscriptionID, predicate: nil, handler: {
            subscriptionID, error in
            // callback the handler with the error
            if let validHandler = handler {
                validHandler(subscriptionID: subscriptionID, error: error)
            }
        })
    }
    
    class func recordType() -> RecordType {
        return .None
    }

}

enum RecordType: String {
    case None    = "None"
    case User    = "User"
    case Message = "Message"
}
