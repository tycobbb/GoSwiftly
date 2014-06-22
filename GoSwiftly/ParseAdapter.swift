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
        
    }
    
    func subcribe(recordType: String, predicate: NSPredicate!, handler: RecordSubscribeHandler?) -> String! {
        return nil
    }
    
    func unsubscribe(recordType: String, predicate: NSPredicate!, handler: RecordUnsubscribeHandler?) {
        
    }
    
}
