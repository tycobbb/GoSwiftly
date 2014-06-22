//
//  TestDynamicFlowLayout.swift
//  SwiftTest
//
//  Created by Ty Cobb on 6/2/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import UIKit

class MessagesCollectionViewLayout : UICollectionViewLayout {
    
    @IBInspectable var itemSize : CGSize!
    @IBInspectable var interitemSpacing : CGFloat!

    override func collectionViewContentSize() -> CGSize {
        return CGSize(
            width:  self.collectionView.bounds.size.width,
            height: (self.itemSize.height + self.interitemSpacing) * CGFloat(self.collectionView.numberOfItemsInSection(0))
        )
    }
    
    override func layoutAttributesForElementsInRect(rect: CGRect) -> AnyObject[]! {
        var layoutAttributes = UICollectionViewLayoutAttributes[]()
        let numberOfItems    = self.collectionView.numberOfItemsInSection(0)
        
        // TODO: only generate attributes for visible-ish rect
        for item in 0..numberOfItems {
            layoutAttributes.append(self.layoutAttributesForItemAtIndexPath(NSIndexPath(forItem: item, inSection: 0)))
        }
        
        return layoutAttributes
    }
    
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath!) -> UICollectionViewLayoutAttributes! {
        let attributes = UICollectionViewLayoutAttributes(forCellWithIndexPath: indexPath)
        
        attributes.size     = self.itemSize
        attributes.center.x = (self.collectionView.bounds.size.width - self.itemSize.width) / 2.0
        attributes.center.y = (self.itemSize.height + self.interitemSpacing) * CGFloat(indexPath.item)
        
        return attributes
    }
   
    //
    // Helpers
    //
  
    func transformAttributes(attributes: UICollectionViewLayoutAttributes) {
        // update the center (so that we can center our icons)
        attributes.center.x += (self.collectionView.bounds.size.width - self.collectionViewContentSize().width) / 2.0
        
        // calculate normalized values for transforming
        let adjustedPosition   = attributes.center.x - self.collectionView.contentOffset.x
        let normalizedPosition = adjustedPosition / self.collectionView.bounds.size.width
        let symmetricPosition  = abs(normalizedPosition - 0.5)
        
        // calculate transforms
        let maximumTranslation = self.collectionView.bounds.size.height * 1.5
        let translation        = pow(CDouble(symmetricPosition), 1.7) //* maximumTranslation
        
        // update the transform
        attributes.transform   = CGAffineTransformTranslate(attributes.transform, 0.0, CGFloat(translation))
    }

}
