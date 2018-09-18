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
    var pauseTime:TimeInterval = 1
    var animationDuration:TimeInterval = 3
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
        scaleAnimation.duration = 2*(animationDuration + pauseTime)
        scaleAnimation.values = [initialPulseScale, 1, 1, initialPulseScale, initialPulseScale]
        scaleAnimation.keyTimes = [0, animationDuration/(2*(animationDuration+pauseTime)) as NSNumber, 0.5, 0.5+(animationDuration/(2*(animationDuration+pauseTime))) as NSNumber, 1]
        return scaleAnimation
    }
    func createOpacityAnimation() -> CAKeyframeAnimation {
        
        let opacityAnimation = CAKeyframeAnimation(keyPath: "opacity")
        opacityAnimation.duration = 2*(animationDuration + pauseTime)
        opacityAnimation.values = [0.8, 0, 0, 0.8, 0.8]
        opacityAnimation.keyTimes = [0, animationDuration/(2*(animationDuration+pauseTime)) as NSNumber, 0.5, 0.5+(animationDuration/(2*(animationDuration+pauseTime))) as NSNumber, 1]
        
        return opacityAnimation
    }
    func setupAnimationGroup() {
        self.animationGroup = CAAnimationGroup()
        self.animationGroup.duration = 2*(animationDuration + pauseTime)
        self.animationGroup.repeatCount = numberOfPulses
        self.animationGroup.autoreverses = false
        self.animationGroup.animations = [createScaleAnimation(), createOpacityAnimation()]
    }
}
