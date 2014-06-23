//
//  Model.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/3/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

typealias ModelsHandler    = (Model[]?, NSError?) -> Void
typealias SubscribeHandler = (String?, NSError?) -> Void

class Model : NSObject {
    
    class func insert(attributes: Dictionary<String, AnyObject>? = nil, handler: ModelsHandler? = nil) {
        // insert a new record
        Records.adapter.insert(self.recordName, attributes: attributes, handler: { records, error in
            Logger.check(error, message: "error inserting \(self.recordName)")
            // callback the handler with the generated model
            handler?(nil, error)
        })
    }
    
    class func fetch(handler: ModelsHandler? = nil) {
        Records.adapter.fetch(self.recordName, handler: { records, error in
            Logger.check(error, message: "error fetching \(self.recordName)")
            handler?(nil, error)
        })
    }
    
    class func subscribe(predicate: NSPredicate? = NSPredicate(value: true), handler: SubscribeHandler? = nil) -> String! {
        // create a new subscription
        return Records.adapter.subcribe(self.recordName, predicate: predicate, handler: { subscription, error in
            Logger.check(error, message: "error subscribing to \(self.recordName)s")
            handler?("dummy", error)
        })
    }
    
    class func unsubscribe(subscriptionId: String, handler: SubscribeHandler? = nil) {
        // remove an existing subscription
        Records.adapter.unsubscribe(subscriptionId, predicate: nil, handler: { subscriptionID, error in
            Logger.check(error, message: "error unsubscribing from <\(self.recordName): \(subscriptionId)>")
            handler?(subscriptionId, error)
        })
    }
    
    class func recordType() -> RecordType {
        return .None
    }
    
    class var recordName : String {
        return self.recordType().toRaw()
    }

}

enum RecordType : String {
    case None    = "None"
    case User    = "User"
    case Message = "Message"
}
