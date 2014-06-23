//
//  ParseAdapter.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/21/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

class ParseAdapter : RecordAdapter {
   
    func initialize() {
        Parse.setApplicationId("18USiMhwxdsk4iEyZyhFKrREQfDl2kdZHV7HBFl4", clientKey: "SijEaoGls8X3BewoXX0h9vnOPtvOSassUSsoUpue")
        Logger.debug("setup Parse | app-id: \( Parse.getApplicationId() ) | key: \( Parse.getClientKey() ) ")
    }
    
    func insert(type: String, attributes: Dictionary<String, AnyObject>?, handler: RecordHandler?) {
        let record = PFObject(className: type, dictionary: attributes)
        record.saveInBackgroundWithBlock { succeeded, error in
            let records = (succeeded && error != nil ? [ record ] : nil) as PFObject[]?
            handler?(records, error)
        }
    }

    func fetch(type: String, handler: RecordHandler?) {
        let query = PFQuery(className: type)
        query.findObjectsInBackgroundWithBlock { objects, error in
            let records = (error != nil ? objects : nil) as PFObject[]?
            handler?(records, error)
        }
    }
    
    func subcribe(recordType: String, predicate: NSPredicate!, handler: RecordSubscribeHandler?) -> String! {
        Logger.debug("Parse adapter doesn't support subscriptions")
        handler?(nil, nil)
        return ""
    }
    
    func unsubscribe(recordType: String, predicate: NSPredicate!, handler: RecordUnsubscribeHandler?) {
        Logger.debug("Parse adapter doesn't support subscriptions")
        handler?(nil, nil)
    }
    
}
