//
//  CollectionViewCell.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/4/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import UIKit

class CollectionViewCell : UICollectionViewCell {
    
    var model: Model?
    
    func updateWithModel(model: Model) {
        self.model = model
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.model = nil
    }
    
    class func identifier() -> String! {
        return nil
    }

}
