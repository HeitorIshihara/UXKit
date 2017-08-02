//
//  SideBarButtonViewController.swift
//  AnimationSamples
//
//  Created by Heitor Ishihara on 17/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

class SideBarButtonViewController: UIViewController {
    
    //Positions
    var viewCenter: CGPoint!
    var topLinePosition: CGPoint!
    var middleLinePosition: CGPoint!
    var bottomLinePosition: CGPoint!
    
    //Views
    var topLineView = UIView()
    var middleLineView = UIView()
    var bottomLineView = UIView()
    
    //Controls how the sidebar status
    var isSideBarOpen = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sideBarButton(viewToDraw: self.view, center: self.view.center, lineColor: UIColor.black, lineLength: 50, lineThickness: 3)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     Draw a side bar button. It consists in 3 stacked lines.
     
     - Parameters:
         - viewToDraw: The view that will contain the side bar button.
     
         - center: The center of the button. Used to set it position.
     
         - lineColor: Color of the lines of the button.
     
         - lineLength: Defines the button width.
     
         - lineThickness: Defines the lines thickness of the button.
     
     */
    public func sideBarButton(viewToDraw: UIView, center: CGPoint, lineColor: UIColor, lineLength: CGFloat, lineThickness: CGFloat){
        
        //Positions
        self.viewCenter = center
        self.topLinePosition = CGPoint(x: viewCenter.x - lineLength / 2, y: view.center.y - lineThickness - 8)
        self.middleLinePosition = CGPoint(x: viewCenter.x - lineLength / 2, y: viewCenter.y)
        self.bottomLinePosition = CGPoint(x: viewCenter.x - lineLength / 2, y: viewCenter.y + lineThickness + 8)
        
        //Set Views
        topLineView = UIView(frame: CGRect(x: topLinePosition.x, y: topLinePosition.y, width: lineLength, height: lineThickness))
        topLineView.backgroundColor = lineColor
        viewToDraw.addSubview(topLineView)
        
        middleLineView = UIView(frame: CGRect(x: middleLinePosition.x, y: middleLinePosition.y, width: lineLength, height: lineThickness))
        middleLineView.backgroundColor = lineColor
        middleLineView.isUserInteractionEnabled = true
        viewToDraw.addSubview(middleLineView)
        
        bottomLineView = UIView(frame: CGRect(x: bottomLinePosition.x, y: bottomLinePosition.y, width: lineLength, height: lineThickness))
        bottomLineView.backgroundColor = lineColor
        viewToDraw.addSubview(bottomLineView)
        
    }
    
    /**
     **You must call the sideBarButton function before calling this one**
     
     Animate the side bar button. Call this function when the button is clicked.
     This animation position the top line and the bottom line in the same position as the middle line.
     
     
     - Parameters:
         - duration: Animation duration in seconds.
     */
    
    public func sideBarButtonAnimation(duration: Double){
        //Set Animations
        UIView.animate(withDuration: duration, delay: 0, options: .curveEaseOut, animations: {
            
            if(!self.isSideBarOpen){
                self.topLineView.frame.origin = self.middleLinePosition
                self.bottomLineView.frame.origin = self.middleLinePosition
                
                self.isSideBarOpen = true
            } else{
                self.topLineView.frame.origin = self.topLinePosition
                self.bottomLineView.frame.origin = self.bottomLinePosition
                
                self.isSideBarOpen = false
            }
        }, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        sideBarButtonAnimation(duration: 0.2)
    }
    
    
    
    @IBAction func animate(_ sender: Any) {
        sideBarButtonAnimation(duration: 0.2)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
