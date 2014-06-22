//
//  ParseAdapter.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/21/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import Foundation

class ParseAdapter : RecordAdapter {
   
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
        
        return nil
    }
    
    func unsubscribe(recordType: String, predicate: NSPredicate!, handler: RecordUnsubscribeHandler?) {
        
    }
    
}
