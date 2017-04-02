//
//  ViewController.swift
//  CarouselTest
//
//  Created by Michael Sweeney on 3/31/17.
//  Copyright © 2017 Michael Sweeney. All rights reserved.
//

import UIKit

//MARK: Constants

let gScreenSize: CGRect = UIScreen.main.bounds
let gCarouselCenterPoint = CGPoint(x: gScreenSize.width/2, y: gScreenSize.height/3)
let gCarouselRadius = UIScreen.main.bounds.width/2
let gThemeColor = #colorLiteral(red: 0.1253122985, green: 0.6035761833, blue: 0.8839741349, alpha: 1)
let gBackGroundColor = #colorLiteral(red: 1, green: 0.969643414, blue: 0.6297263503, alpha: 1)

class ViewController: UIViewController {
    
    //MARK: HOW TO USE
    
    //1: define an optional carousel which we will initialize once we create the views that will go in the carousel
    
    var myCarousel :  SimpleCarousel?
    
    //2: (Optional) Create an array to hold our views (or create a temp array later)
    //var views = [UIImageView]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createSomeViews()
        self.setupSwipes()
    }
    
    //MARK: Gestures
    
    fileprivate func setupSwipes(){
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGesture(_:)))
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeGesture(_:)))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        swipeRight.direction = UISwipeGestureRecognizerDirection.right
        self.view.addGestureRecognizer(swipeLeft)
        self.view.addGestureRecognizer(swipeRight)
    }
    
    func swipeGesture(_ gesture: UISwipeGestureRecognizer){
        
        //3: Setup our trigger(s) or swipe in this case, that will prompt the carausel to move
        
        if gesture.direction == UISwipeGestureRecognizerDirection.left {
            guard let carousel = self.myCarousel else { return }
            carousel.animate(clockwise: true) //Clockwise as true will move all views left
        }
        else if gesture.direction == UISwipeGestureRecognizerDirection.right {
            guard let carousel = self.myCarousel else { return }
            carousel.animate(clockwise: false) //Clockwise as false will move all views right
        }
    }
    
    //4: Create our uiviews and initialize our carousel
    
    func createSomeViews() {
    
        var array = [UIImageView]()         // The temp array
        for _ in 0..<5 {
            let view = UIImageView(frame: CGRect(x: 0, y: 0, width: gScreenSize.width/2, height: gScreenSize.width/2 + 75))
            view.backgroundColor = gThemeColor
            view.layer.borderWidth = 2
            view.layer.borderColor = gBackGroundColor.cgColor
            array.append(view)
            self.view.addSubview(view)
        }
        
        //to initialize the carousel...
        self.myCarousel = SimpleCarousel(withCenterPoint: gCarouselCenterPoint, withRadius: gCarouselRadius, withDuration: 0.7, withResizing: true, withViews: array)
        
        //5: Play around with various properties and parameters to get the look you want
        
        //self.myCarousel?.sizeIncrease = 1.5
        //self.myCarousel?.sizeDecrease = 0.5
        //self.myCarousel?.animationTime = 2
        //self.myCarousel?.radius = gScreenSize.width
        //self.myCarousel?.sizeIncrease = 0.5
        //self.myCarousel?.sizeDecrease = 1.5
    }
    
}

