//
//  FourBalls.swift
//  AnimationKit
//
//  Created by Heitor Ishihara on 25/07/17.
//  Copyright © 2017 Heitor Ishihara. All rights reserved.
//

import UIKit

class FourBalls: UIView {
    
    //Circles
    var mainCircle = UIView()
    var topCircle = UIView()
    var rightCircle = UIView()
    var bottomCircle = UIView()
    var leftCircle = UIView()
    
    var circleSize: CGFloat?
    var mainCircleCornerRadius: CGFloat?
    
    var fourBallsPosition = CGPoint()
    var fourBallsPositionX: CGFloat?
    var fourBallsPositionY: CGFloat?
    
    var calledDrawFourBalls = false
    
    /**
     Draw all the balls.
     
     - Parameters:
         - mainView: The view that contains the four balls.
     
         - circleSize: Defines the main ball size. The other balls will have half of the size.
     
         - fourBallsPosition: Center of the balls. Used to define it position.
     
         - mainBallColor: Color of the main ball.
     
         - topBallColor: Color of the ball that goes up.
     
         - rightBallColor: Color of the ball that goes right.
     
         - bottomBallColor: Color of the ball that goes down.
     
         - leftBallColor: Color of the ball that goes left.
     */
    
    public func drawFourBalls(mainView: UIView, circleSize: CGFloat, fourBallsCenter: CGPoint, mainBallColor: UIColor, topBallColor: UIColor, rightBallColor: UIColor, bottomBallColor: UIColor, leftBallColor: UIColor){
        
        let sideBallsSize = circleSize / 2
        let sideCirclesCornerRadius = sideBallsSize / 2
        
        //Set Attributes
        self.circleSize = circleSize
        self.mainCircleCornerRadius = circleSize / 2
        self.fourBallsPosition = fourBallsCenter
        self.fourBallsPositionX = fourBallsCenter.x
        self.fourBallsPositionY = fourBallsCenter.y
        
        //Set Circles
        mainCircle = UIView(frame: CGRect(x: fourBallsCenter.x, y: fourBallsCenter.y, width: circleSize, height: circleSize))
        mainCircle.center = fourBallsCenter
        mainCircle.backgroundColor = mainBallColor
        mainCircle.layer.cornerRadius = mainCircleCornerRadius!
        mainCircle.layer.zPosition = 0
        mainView.addSubview(mainCircle)
        
        topCircle = UIView(frame: CGRect(x: fourBallsCenter.x, y: fourBallsCenter.y, width: sideBallsSize, height: sideBallsSize))
        topCircle.center = fourBallsCenter
        topCircle.backgroundColor = topBallColor
        topCircle.layer.cornerRadius = sideCirclesCornerRadius
        topCircle.layer.zPosition = -1
        mainView.addSubview(topCircle)
        
        rightCircle = UIView(frame: CGRect(x: fourBallsCenter.x, y: fourBallsCenter.y, width: sideBallsSize, height: sideBallsSize))
        rightCircle.center = fourBallsCenter
        rightCircle.backgroundColor = rightBallColor
        rightCircle.layer.cornerRadius = sideCirclesCornerRadius
        rightCircle.layer.zPosition = -2
        mainView.addSubview(rightCircle)
        
        bottomCircle = UIView(frame: CGRect(x: fourBallsCenter.x, y: fourBallsCenter.y, width: sideBallsSize, height: sideBallsSize))
        bottomCircle.center = fourBallsCenter
        bottomCircle.backgroundColor = bottomBallColor
        bottomCircle.layer.cornerRadius = sideCirclesCornerRadius
        bottomCircle.layer.zPosition = -3
        mainView.addSubview(bottomCircle)
        
        leftCircle = UIView(frame: CGRect(x: fourBallsCenter.x, y: fourBallsCenter.y, width: sideBallsSize, height: sideBallsSize))
        leftCircle.center = fourBallsCenter
        leftCircle.backgroundColor = leftBallColor
        leftCircle.layer.cornerRadius = sideCirclesCornerRadius
        leftCircle.layer.zPosition = -4
        mainView.addSubview(leftCircle)
        
        self.calledDrawFourBalls = true
        
    }
    
    /**
     **You must call the drawFourBalls function before calling this one**
     
     Animate the four balls.
     
     - Parameters:
         - animationDuration: Animation duration in seconds.
     
     */
    
    public func fourBallsAnimation(animationDuration: Double){
        
        if(calledDrawFourBalls){
            
            
            UIView.animate(withDuration: animationDuration, delay: 0, animations: {
                self.topCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY! - self.circleSize! - 5)
                
                self.rightCircle.center = CGPoint(x: self.fourBallsPositionX! + self.circleSize! + 5, y: self.fourBallsPositionY!)
                
                self.bottomCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY! + self.circleSize! + 5)
                
                self.leftCircle.center = CGPoint(x: self.fourBallsPositionX! - self.circleSize! - 5, y: self.fourBallsPositionY!)
                
                self.mainCircle.frame.size = CGSize(width: self.mainCircle.frame.size.width / 2, height: self.mainCircle.frame.size.height / 2)
                self.mainCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY!)
                self.mainCircle.layer.cornerRadius = self.mainCircleCornerRadius! / 2
                
            }, completion: { completion in
                UIView.animate(withDuration: animationDuration, delay: 0, animations: {
                    self.topCircle.center = self.fourBallsPosition
                    self.rightCircle.center = self.fourBallsPosition
                    self.bottomCircle.center = self.fourBallsPosition
                    self.leftCircle.center = self.fourBallsPosition
                    
                    self.mainCircle.frame.size = CGSize(width: self.circleSize!, height: self.circleSize!)
                    self.mainCircle.center = CGPoint(x: self.fourBallsPositionX!, y: self.fourBallsPositionY!)
                    self.mainCircle.layer.cornerRadius = self.mainCircleCornerRadius!
                    
                    
                }, completion: nil)
            })
            
        }
    }
    
}

