//
//  SimpleCarousel.swift
//  CarouselTest
//
//  Created by Michael Sweeney on 4/1/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

class SimpleCarousel{
    
    var screenSize: CGRect{             // Read only property
        return UIScreen.main.bounds
    }
    let centerPoint: CGPoint            // A point defining the center of the carousel cirlce
    var sizeIncrease: CGFloat = 1.2 {
        // Value from 0 to 1.0 used to determine how large a view should grow when in the foreground
        didSet {
            self.moveViewsToIntialPositions()
        }
    }
    var sizeDecrease: CGFloat = 0.8 {
        // Value from 0 to 1.0 used to determine how small a view should shrink when in the background
        didSet {
            self.moveViewsToIntialPositions()
        }
    }
    
    var resizeViews: Bool
    // Default is YES. If set to NO, views will not change sizes when tranisitioning from background to forground and vice versa.
    var objects = [UIView]()
    // All the views that will be resized and/or moved with the carousel
    var animationTime: Double
    // The total time for one change of views in either direction
    var radius: CGFloat
    
    //properties to caputure intial settings of users views
    var viewDefaultSize: CGSize?
    var viewSmallSize: CGSize?
    var viewLargeSize: CGSize?
    
    var numberOfViews: Int {            // Read only property
        return self.objects.count
    }
    
    init(withCenterPoint center: CGPoint, withRadius radius:CGFloat, withDuration duration:Double, withResizing resize:Bool, withViews views: [UIView]) {
        self.centerPoint = center
        self.animationTime = duration
        self.radius = radius
        self.objects = views
        self.resizeViews = resize
        if !views.isEmpty {
            self.viewDefaultSize = views[0].frame.size
        }
        
        self.moveViewsToIntialPositions()
    }
    
    func moveViewsToIntialPositions() {
        for (index, view) in self.objects.enumerated() {
            let angle = CGFloat(90 + index * (360/self.numberOfViews))
            let x = self.centerPoint.x + CGFloat(self.radius) * cos(angle * CGFloat(M_PI/180))
            let y = self.centerPoint.y + CGFloat(self.radius) * sin(angle * CGFloat(M_PI/180))
            let position = CGPoint(x: x, y: y)
            if self.resizeViews {
                switch position.y {
                case 0..<self.centerPoint.y:
                    view.superview?.sendSubview(toBack: view)
                    view.transform = CGAffineTransform(scaleX: self.sizeDecrease, y: self.sizeDecrease)
                    self.viewSmallSize = view.frame.size
                case (self.centerPoint.y)..<self.centerPoint.y + self.radius - 1:
                    view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                case self.centerPoint.y + self.screenSize.width / 2:
                    view.superview?.bringSubview(toFront: view)
                    view.transform = CGAffineTransform(scaleX: self.sizeIncrease, y: self.sizeIncrease)
                    self.viewLargeSize = view.frame.size
                default:
                    print("Undefined initial starting size")
                }
            }
            view.center = position
        }
    }
    
    func animate(clockwise: Bool) {
        // Method to call to move views in a horizontal direction determined by the clockwise argument
        for view in self.objects {
            
            let currentAngle = self.angleFromPoint(pos: view.center)
            let nextAngle = self.getNextAngle(currentAngle: currentAngle, clockwise: clockwise)
            let destination = pointFromAngle(angle: nextAngle)
            
            UIView.animateKeyframes(withDuration: self.animationTime, delay: 0.0, options: .calculationModeCubicPaced, animations: {
                UIView.addKeyframe(withRelativeStartTime: 0, relativeDuration: 1.0, animations: {
                    
                    switch destination.y {
                        
                    case self.centerPoint.y - self.radius..<self.centerPoint.y:
                        view.superview?.sendSubview(toBack: view)
                        if self.resizeViews {
                            if view.frame.size != self.viewSmallSize {
                                view.transform = CGAffineTransform(scaleX: self.sizeDecrease, y: self.sizeDecrease)
                            }
                        }
                    case (self.centerPoint.y)..<self.centerPoint.y + self.radius - 1:
                        if self.resizeViews {
                            if view.frame.size != self.viewDefaultSize {
                                view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                            }
                        }
                    case self.centerPoint.y + self.radius:
                        view.superview?.bringSubview(toFront: view)
                        if self.resizeViews {
                            view.transform = CGAffineTransform(scaleX: self.sizeIncrease, y: self.sizeIncrease)
                        }
                    default:
                        print("View outside of carousel bounds. Will not alter its size")
                    }
                    
                    
                    view.center = destination
                })
            }) { (finished) in
                //Anything important to do after animations complete
            }
        }
    }
    
    fileprivate func getNextAngle (currentAngle: CGFloat, clockwise: Bool) -> CGFloat {
        
        if clockwise == true {
            return currentAngle + CGFloat(2 * M_PI / Double(self.numberOfViews))
        }
        else {
            return currentAngle - CGFloat(2 * M_PI / Double(self.numberOfViews))
        }
    }
    
    fileprivate func angleFromPoint (pos: CGPoint) -> CGFloat {
        let angle = atan2(pos.y - self.centerPoint.y, pos.x - self.centerPoint.x)
        return angle
    }
    
    fileprivate func pointFromAngle (angle: CGFloat) -> CGPoint {
        //(x,y) = cx + rcos0, cy + sin0
        return CGPoint(x: self.centerPoint.x + (self.radius) * cos(angle), y:self.centerPoint.y + (self.radius) * sin(angle))
    }
}
