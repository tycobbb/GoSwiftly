//
//  MessageCollectionViewCell.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/4/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import UIKit

class MessageCollectionViewCell : CollectionViewCell {

    var message : Message? { get {
        return self.model as? Message
    }}
    
    override func updateWithModel(model: Model) {
        super.updateWithModel(model)
    }
    
    override class func identifier() -> String {
        return "MessageCollectionViewCell"
    }
    
}
