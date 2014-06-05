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
        
        User.fetch({
            (users: Model[]?, error: NSError?) in
        })
        
        Message.subscribe()
        
        Message.insert(attributes: [
            "text" : "GO"
        ], handler: {
            (messages: Model[]?, error: NSError?) in
        })
    }
    
}
