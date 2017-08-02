//
//  FullScreenViewController.swift
//  AnimationSamples
//
//  Created by Heitor Ishihara on 24/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

class FullScreenViewController: UIViewController {
    
    var myView = UIView()
    var aumentou: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myView = UIView(frame: CGRect(x: view.center.x, y: view.center.y, width: 80, height: 80))
        myView.center = view.center
        myView.backgroundColor = #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)
        myView.layer.cornerRadius = 10
        myView.isUserInteractionEnabled = true
        self.view.addSubview(myView)
        
        aumentou = false
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            
            let touchPoint = touch.location(in: self.view)
            
            if(myView.frame.contains(touchPoint)){
                
                if !aumentou {
                    self.myView.makeViewFullScreen(mainView: self.view, duration: 1)
                    self.aumentou = true
                    
                } else {
                    self.myView.makeViewNormal(viewSize: CGSize(width: 50, height: 50), viewPosition: CGPoint(x: 50, y: 50), duration: 1)
                    self.aumentou = false
                }
            }
        }
    }
    
    @IBAction func animation(_ sender: Any) {
        //        myView.makeViewFullScreen(_sender: self.myView, mainView: self.view, duration: 1)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

//Extension Code
public extension UIView{
    
    /**
     Makes the desired UIView full screen.
     
     - Parameters:
         - mainView: The main view of your application. Used to set the desired view to full screen mode.
     
         - duration: Animation duration in seconds.
     */
    public func makeViewFullScreen(mainView: UIView, duration: Double){
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.frame.size = mainView.frame.size
            self.center = mainView.center
        }, completion: nil)
    }
    
    /**
     Makes the view go back to it normal size.
     
     - Parameters:
         - viewSize: Normal size of the view that was full screen.
         - viewPosition: Normal position of the view that was full screen.
         - duration: Animation duration in seconds.
     */
    
    public func makeViewNormal(viewSize: CGSize, viewPosition: CGPoint ,duration: Double){
        
        UIView.animate(withDuration: duration, delay: 0, usingSpringWithDamping: 0.5, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
            self.frame.size = viewSize
            self.frame.origin = viewPosition
        }, completion: nil)
        
    }
    
}




















