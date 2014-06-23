//
//  MessageCollectionViewCell.swift
//  GoSwiftly
//
//  Created by Ty Cobb on 6/4/14.
//  Copyright (c) 2014 Ty Cobb. All rights reserved.
//

import UIKit
import QuartzCore

@IBDesignable

class MessagesCollectionViewCell : CollectionViewCell, UIGestureRecognizerDelegate {
    
    @lazy var iconLayer  : CAShapeLayer = CAShapeLayer()
    @lazy var iconMask   : CAShapeLayer = CAShapeLayer()
    @lazy var checkLayer : CAShapeLayer = CAShapeLayer()

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.iconLayer.lineWidth   = 18.0
        self.iconLayer.strokeColor = UIColor(red: 0.1, green: 0.2, blue: 0.8, alpha: 0.8).CGColor
        self.iconLayer.fillColor   = UIColor(red: 1.0, green: 0.2, blue: 0.0, alpha: 0.5).CGColor
        self.iconLayer.strokeEnd   = 0.0
        
        self.layer.addSublayer(self.iconLayer)
        self.iconMask.fillRule = kCAFillRuleEvenOdd
        self.iconLayer.mask    = self.iconMask
        
        self.addGestureRecognizer(self.pressGesture)
        self.pressGesture.minimumPressDuration = 0.1
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.bounds.size.width / 2.0
        self.iconLayer.path     = self.iconPath().CGPath
        self.iconMask.path      = self.maskPath().CGPath
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.iconLayer.strokeEnd = 0.0
    }
    
    // Helpers
    
    func iconPath() -> UIBezierPath {
        return UIBezierPath(ovalInRect: self.pathRect())
    }
    
    func maskPath() -> UIBezierPath {
        let innerRect = self.pathRect(inset: self.iconLayer.lineWidth / 2.0)
        let path = self.iconPath()
        path.appendPath(UIBezierPath(ovalInRect: innerRect))
        return path
    }
    
    func pathRect(inset: CGFloat! = 0.0) -> CGRect {
        let totalInset = 10.0 + inset
        return self.bounds.rectByInsetting(dx: totalInset, dy: totalInset)
    }
    
    //
    // Data Binding
    //
    
    var message : Message? {
        return self.model as? Message
    }
    
    override func updateWithModel(model: Model) {
        super.updateWithModel(model)
    }
    
    override class func identifier() -> String {
        return "MessagesCollectionViewCell"
    }
    
    //
    // Gestures
    //
    
    let pressAnimationKey : String = "icon-fill-animation"
    @lazy var pressGesture : UILongPressGestureRecognizer =
        UILongPressGestureRecognizer(target: self, action: Selector("handleLongPressGesture:"))
    
    func gestureRecognizer(gestureRecognizer: UIGestureRecognizer!, shouldRecognizeSimultaneouslyWithGestureRecognizer otherGestureRecognizer: UIGestureRecognizer!) -> Bool {
        return true
    }
    
    func handleLongPressGesture(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
            case .Began:
                self.didBeginLongPressGesture(gesture)
            case .Ended, .Cancelled:
                self.didEndLongPressGesture(gesture)
            default: println()
        }
    }
    
    func didBeginLongPressGesture(gesture: UILongPressGestureRecognizer) {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        
        animation.fromValue = 0.0
        animation.toValue   = 1.0
        animation.duration  = 0.6
        animation.delegate  = self
    
        self.iconLayer.addAnimation(animation, forKey: self.pressAnimationKey)
        
        CATransaction.setDisableActions(true)
        self.iconLayer.strokeEnd = 1.0
        CATransaction.setDisableActions(false)
    }
    
    func didEndLongPressGesture(gesture: UILongPressGestureRecognizer) {
        let presentationLayer   = self.iconLayer.presentationLayer() as CAShapeLayer
        self.iconLayer.strokeEnd = presentationLayer.strokeEnd
        self.iconLayer.removeAnimationForKey(self.pressAnimationKey)
        self.iconLayer.strokeEnd = 0.0
    }
    
    //
    // CAAnimationDelegate
    //
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        if flag {
            println("recognized")
        }
    }
    
}
