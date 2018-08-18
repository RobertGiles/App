//
//  pulsing.swift
//  COSC345
//
//  Created by Nathan Laing on 7/21/18.
//  Copyright © 2018 Ethan Brake. All rights reserved.
//

import UIKit

class pulsing: CALayer {
    var animationGroup = CAAnimationGroup()
    // Settings for animation
    var initialPulseScale:Float = 0.2
    var pulsePauseAfter:TimeInterval = 1.0
    // original val was 4
    var animationDuration:TimeInterval = 2.0
    var radius:CGFloat = 200
    var numberOfPulses:Float = Float.infinity
    
    //Initialisers
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init (numberOfPulses:Float = Float.infinity, radius:CGFloat, position:CGPoint) {
        super.init()
        
        self.backgroundColor = UIColor.red.cgColor
        self.contentsScale = UIScreen.main.scale
        self.opacity = 0
        self.radius = radius
        self.numberOfPulses = numberOfPulses
        self.position = position
        
        self.bounds = CGRect(x: 0, y: 0, width: radius * 2, height: radius * 2)
        self.cornerRadius = radius
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.setupAnimationGroup()
            
            DispatchQueue.main.async {
                self.add(self.animationGroup, forKey: "pulse")
            }
        }
    }
    
    func createScaleAnimation () -> CAKeyframeAnimation {
        let scaleAnimation = CAKeyframeAnimation(keyPath: "transform.scale.xy")
        scaleAnimation.values = [initialPulseScale as NSNumber, 1, 0.99, (initialPulseScale-0.01) as NSNumber, initialPulseScale as NSNumber]
        scaleAnimation.keyTimes = [0, NSNumber(value: 0.5*(animationDuration/(animationDuration + pulsePauseAfter))), 0.5, ((2*animationDuration+pulsePauseAfter)/(2*(animationDuration+pulsePauseAfter))) as NSNumber, 1]
        scaleAnimation.duration = 2*(animationDuration + pulsePauseAfter)
        
        return scaleAnimation
    }
    
    func createOpacityAnimation() -> CAKeyframeAnimation {
        
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = 2*(animationDuration + pulsePauseAfter)
        opacityAnimation.values = [0.4, 0.8, 0, 0.01, 0.8, 0.4, 0.41]
        opacityAnimation.keyTimes = [0, (animationDuration/(4*(animationDuration+pulsePauseAfter))) as NSNumber, (animationDuration/(2*(animationDuration+pulsePauseAfter))) as NSNumber, 0.5, (0.5 + animationDuration/(4*(animationDuration+pulsePauseAfter))) as NSNumber,(0.5 + animationDuration/(2*(animationDuration+pulsePauseAfter))) as NSNumber, 1]
        
        return opacityAnimation
    }
    
    func setupAnimationGroup() {
        self.animationGroup = CAAnimationGroup()
        self.animationGroup.duration = 2*(animationDuration + pulsePauseAfter)
        self.animationGroup.repeatCount = numberOfPulses
        /*  Means that the animations are played, then played in reverse
            In this case, if an animation is short than the animation group threshhold,
            it plays the animation then waits for the duration.
            Reverse then waits for the duration and plays the animation backwards.
        */
        // self.animationGroup.autoreverses = true
        
        let defaultCurve = CAMediaTimingFunction(name: kCAMediaTimingFunctionDefault)
        self.animationGroup.timingFunction = defaultCurve
        
        self.animationGroup.animations = [createScaleAnimation(), createOpacityAnimation()]
    }
}
