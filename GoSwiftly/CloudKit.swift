//
//  CloudKit.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/3/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import CloudKit

//
// Records
//

typealias CKRecordHandler = (CKRecord!, NSError!) -> Void

extension CKRecord {
    
    class func build(type: String) -> CKRecord {
        // build and return the record
        return CKRecord(recordType: type)
    }
    
    /// creates and persists a new CKRecord mapping from the model class
    class func insert(type: String, attributes: Dictionary<String, AnyObject>? = nil, handler: CKRecordHandler? = nil) {
        
        let record = CKRecord.build(type)
        
        // update the record with the passed in attributes, if any
        record.setValuesForKeysWithDictionary(attributes)
        
        println("RECORD - will insert: \(record)\n")
        // save the record to the public database
        CKContainer.defaultContainer().publicCloudDatabase.saveRecord(record) {
            record, error in
            
            println("RECORD - did insert: \(record)\n\t\(error?.localizedDescription)")
            // callback the consumer's handler, if it exists
            handler?(record, error)
        }
    }
    
}

//
// Subscriptions
//

typealias CKSubscriptionHandler   = (CKSubscription!, NSError!) -> Void
typealias CKUnsubscriptionHandler = (String!, NSError!) -> Void

extension CKSubscription {
    
    class func defaultOptions() -> CKSubscriptionOptions {
        return .FiresOnRecordCreation | .FiresOnRecordDeletion | .FiresOnRecordUpdate
    }
    
    class func subcribe(recordType: String, predicate: NSPredicate!, options: CKSubscriptionOptions! = CKSubscription.defaultOptions(), handler: CKSubscriptionHandler?) -> String! {
                                                  
        let subscription     = CKSubscription(recordType: recordType, predicate: predicate, options: options)
        let notificationInfo = CKNotificationInfo()
        
        notificationInfo.alertLocalizationKey = "It's GO time!"
        subscription.notificationInfo = notificationInfo
        
        CKContainer.defaultContainer().publicCloudDatabase.saveSubscription(subscription) {
            subscription, error in
            NSOperationQueue.mainQueue().addOperationWithBlock {
                println("SUBSCRIBE - did finish: \(subscription)\n\terror: \(error)")
                handler?(subscription, error)
            }
        }
        
        return subscription.subscriptionID
    }
    
    class func unsubscribe(recordType: String, predicate: NSPredicate!, handler: CKUnsubscriptionHandler?) {
        CKContainer.defaultContainer().publicCloudDatabase.deleteSubscriptionWithID(recordType) {
            subscriptionID, error in
            println("UNSUBSCRIBE - did finish: \(subscriptionID)\n\terror: \(error)")
            handler?(subscriptionID, error)
        }
    }
    
}

//
// Operations
//

extension CKOperation {
    
    func enqueue() {
        self.usesBackgroundSession = true
        CKContainer.defaultContainer().addOperation(self)
    }
    
}

extension CKDiscoverAllContactsOperation {
    
    class func start(handler: (AnyObject[]!, NSError!) -> Void) {
        let operation = self()
        operation.discoverAllContactsCompletionBlock = handler
        operation.enqueue()
    }
    
}

extension CKModifyRecordsOperation {

    class func start(records: CKRecord[], handler: (AnyObject[]!, AnyObject[]!, NSError!) -> Void) {
        let operation = self()
        
        operation.modifyRecordsCompletionBlock = handler
        operation.recordsToSave = records
        operation.database = CKContainer.defaultContainer().publicCloudDatabase
        
        operation.enqueue()
    }
    
}
