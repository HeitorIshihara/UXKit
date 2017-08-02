//
//  PulseAnimationViewController.swift
//  AnimationSamples
//
//  Created by Heitor Ishihara on 16/07/17.
//  Copyright © 2017 Erick Borges. All rights reserved.
//

import UIKit

class PulseAnimationViewController: UIViewController {

    @IBOutlet weak var labelTester: UILabel!
    @IBOutlet weak var playButton: UIButton!
    let circleLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pulseAnimation(viewToAnimate: playButton, animationDuration: 0.8, repeatCount: HUGE, maxPulse: 0.8, maxOpacity: 0.8)
        
        pulseAnimation(viewToAnimate: labelTester, animationDuration: 0.8, repeatCount: HUGE, maxPulse: 0.8, maxOpacity: 0.8)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**
     Provides a pulsing effect to an UIView.
     
     - Parameters:
         - viewToAnimate: Defines the UIView that will receive the pulsing animation.
     
         - animationDuration: Animation duration in seconds.
     
         - repeatCount: How many times the animation will run. You can set a infinity value.
     
         - maxPulse: Defines how much the view will pulse.
     
             **Goes from 0 to 1.**
 
         - maxOpacity: Defines how much transparency the view will achieve.
     
             **Goes from 0 to 1.**
     
     */
    
    public func pulseAnimation(viewToAnimate: UIView, animationDuration: Double, repeatCount: Float, maxPulse: Double, maxOpacity: Double){
        //Pulse Animation
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.fromValue = 1.0
        pulseAnimation.toValue = maxPulse
        pulseAnimation.duration = animationDuration
        pulseAnimation.repeatCount = repeatCount
        pulseAnimation.autoreverses = true
        viewToAnimate.layer.add(pulseAnimation, forKey: "addLayerAnimationScale")
        
        //Opacity Animation
        let opacityAnimation = CABasicAnimation(keyPath: "opacity")
        opacityAnimation.fromValue = 1.0
        opacityAnimation.toValue = maxOpacity
        opacityAnimation.duration = animationDuration
        opacityAnimation.repeatCount = repeatCount
        opacityAnimation.autoreverses = true
        viewToAnimate.layer.add(opacityAnimation, forKey: "addLayerAnimationOpacity")
    }
    
    @IBAction func animate(_ sender: Any) {
        pulseAnimation(viewToAnimate: playButton, animationDuration: 0.8, repeatCount: HUGE, maxPulse: 0.8, maxOpacity: 0.8)
        
        pulseAnimation(viewToAnimate: labelTester, animationDuration: 0.8, repeatCount: HUGE, maxPulse: 0.8, maxOpacity: 0.8)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}


