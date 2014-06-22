//
//  MessagesViewController.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/4/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import UIKit

class MessagesViewController : UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet var collectionView : UICollectionView
    
    var messages : Array<Message> = [] {
        didSet { self.collectionView?.reloadData() }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.messages = [ "GO", "YO", "SLOW" ].map({
            text in Message(text: text)
        }).sample(30)
    }
    
    //
    // UICollectionViewDataSource
    //
    
    func collectionView(collectionView: UICollectionView!, numberOfItemsInSection section: Int) -> Int {
        return self.messages.count
    }
    
    func collectionView(collectionView: UICollectionView!, cellForItemAtIndexPath indexPath: NSIndexPath!) -> UICollectionViewCell! {
        let identifier = MessagesCollectionViewCell.identifier()
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(identifier, forIndexPath: indexPath) as MessagesCollectionViewCell
        cell.updateWithModel(self.messageAtIndexPath(indexPath))
        return cell
    }
    
    //
    // UICollectionViewDelegate
    //
    
    func collectionView(collectionView: UICollectionView!, didSelectItemAtIndexPath indexPath: NSIndexPath!) {
        println("neat!")
    }
    
    //
    // Helpers
    //
    
    func messageAtIndexPath(indexPath: NSIndexPath) -> Message {
        return self.messages[indexPath.item]
    }
    
}
