//
//  RecordAdapter.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/21/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

typealias RecordHandler            = (AnyObject!, NSError!) -> Void
typealias RecordSubscribeHandler   = (AnyObject!, NSError!) -> Void
typealias RecordUnsubscribeHandler = (String!, NSError!) -> Void

@class_protocol protocol RecordAdapter {
    func insert(type: String, attributes: Dictionary<String, AnyObject>?, handler: RecordHandler?) -> Void
    func subcribe(recordType: String, predicate: NSPredicate!, handler: RecordSubscribeHandler?) -> String!
    func unsubscribe(recordType: String, predicate: NSPredicate!, handler: RecordUnsubscribeHandler?) -> Void
}