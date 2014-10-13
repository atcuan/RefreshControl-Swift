//
//  Arrow.swift
//  RefreshControl-Swift
//
//  Created by Moch on 10/13/14.
//  Copyright (c) 2014 Moch. All rights reserved.
//

let kArrowPointCount = 7

import UIKit

class Arrow: UIView {
    
    required init(coder aDecoder: NSCoder) {
        self.color = UIColor.lightGrayColor()
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
    }
    
    let color: UIColor?
    override init(frame: CGRect) {
        self.color = UIColor.lightGrayColor()
        super.init(frame: frame)
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func drawRect(rect: CGRect) {
        let startPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMaxY(self.bounds));
        let endPoint = CGPointMake(CGRectGetMidX(self.bounds), CGRectGetMinY(self.bounds));
        let tailWidth = CGRectGetWidth(self.bounds) / 3;
        let headWidth = CGRectGetWidth(self.bounds) * 0.7;
        let headLength = CGRectGetHeight(self.bounds) / 2;
        let bezierPath = UIBezierPath.bezierPathWithArrowFromPointStartPoint(startPoint, toPoint: endPoint, tailWidth: tailWidth, headWidth: headWidth, headLength: headLength)
        self.color?.setFill()
        bezierPath.fill()
    }
    
    func rotation() {
        UIView.animateWithDuration(0.2, animations: {
            self.transform = CGAffineTransformMakeRotation(CGFloat(M_PI))
        })
    }
    
    func identity() {
        UIView.animateWithDuration(0.2, animations: {
            self.transform = CGAffineTransformIdentity
        })
    }
}

// MARK: - UIBezierPath extension
extension UIBezierPath {
    
    class func bezierPathWithArrowFromPointStartPoint(startPoint: CGPoint, toPoint endPoint: CGPoint, tailWidth: CGFloat, headWidth: CGFloat, headLength: CGFloat) -> UIBezierPath {
        let xDiff = Float(endPoint.x - startPoint.x)
        let yDiff = Float(endPoint.y - startPoint.y)
        let length = CGFloat(hypotf(xDiff, yDiff))
        var points = [CGPoint](count: Int(kArrowPointCount), repeatedValue: CGPointZero)
        self.axisAlignedArrowPoints(&points, forLength: length, tailWidth: tailWidth, headWidth: headWidth, headLength: headLength)
        var transform: CGAffineTransform = self.transformForStartPoint(startPoint, endPoint: endPoint, length: length)
        
        var cgPath: CGMutablePathRef = CGPathCreateMutable()
        CGPathAddLines(cgPath, &transform, points, 7)
        CGPathCloseSubpath(cgPath)
        
        var uiPath: UIBezierPath = UIBezierPath(CGPath: cgPath)
        return uiPath
        
    }
    
    private class func axisAlignedArrowPoints(inout points: [CGPoint], forLength length: CGFloat, tailWidth: CGFloat, headWidth: CGFloat, headLength: CGFloat) {
        let tailLength = length - headLength
        points[0] = CGPointMake(0, tailWidth / 2)
        points[1] = CGPointMake(tailLength, tailWidth / 2)
        points[2] = CGPointMake(tailLength, headWidth / 2)
        points[3] = CGPointMake(length, 0)
        points[4] = CGPointMake(tailLength, -headWidth / 2)
        points[5] = CGPointMake(tailLength, -tailWidth / 2)
        points[6] = CGPointMake(0, -tailWidth / 2)
    }
    
    private class func transformForStartPoint(startPoint: CGPoint, endPoint: CGPoint, length: CGFloat) -> CGAffineTransform {
        let cosine = (endPoint.x - startPoint.x) / length
        let sine = (endPoint.y - startPoint.y) / length
        return CGAffineTransformMake(cosine, sine, -sine, cosine, startPoint.x, startPoint.y)
    }
}

