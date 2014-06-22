//
//  MainViewController.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/3/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
                
        User.fetch {
            users, error in
        }
        
        let messageText = [ "GO", "YO", "WHOA" ].random()
        
//        Message.subscribe(handler: {
//            subscriptionID, error in
////            if let validError = error {
////                Message.unsubscribe(subscriptionID)
////            } else {
//                Message.insert(attributes: [ "text" : messageText ], handler: {
//                    messages, error in
//                })
////            }
//        })
    }
    
}
