//
//  Extensions.swift
//  drawShapes
//
//  Created by Niklas Danz on 24.01.17.
//  Copyright © 2017 Niklas Danz. All rights reserved.
//

import UIKit

extension CAShapeLayer {
    // requires the existence of a path
    func animateToPath(path: CGPath, duration: Double) {
        if self.path != nil {
            let expandAnimation: CABasicAnimation = CABasicAnimation(keyPath: "path")
            expandAnimation.fromValue = self.path!
            print("Animating to path")
            expandAnimation.toValue = path
            expandAnimation.duration = duration
            expandAnimation.fillMode = kCAFillModeForwards
            // Do a linear animation (i.e. the speed of the animation stays the same)
            expandAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
            expandAnimation.isRemovedOnCompletion = false
            self.add(expandAnimation, forKey: "path")
            self.path = path
        } else {
            fatalError("CAShapeLayer property 'path' has no value. Failed to animate to new path.")
        }
    }
}

extension UIColor {
    struct alive {
        static var yellow: UIColor { get { return UIColor(red: 220/255, green: 210/255, blue: 0/255, alpha: 1.0) } }
        static var white: UIColor { get { return UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0) } }
        static var blue: UIColor { get { return UIColor(red: 10/255, green: 10/255, blue: 220/255, alpha: 1.0) } }
    }
}


// TEST ANIMATION
//    func animate(layer: CAShapeLayer, withDuration: TimeInterval) {
//        // We want to animate the strokeEnd property of the circleLayer
//        let animation = CABasicAnimation(keyPath: "strokeEnd")
//
//        // Set the animation duration appropriately
//        animation.duration = withDuration
//
//        // Animate from 0 (no circle) to 1 (full circle)
//        animation.fromValue = 0
//        animation.toValue = 1
//
//        // Do a linear animation (i.e. the speed of the animation stays the same)
//        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
//
//        // Set the circleLayer's strokeEnd property to 1.0 now so that it's the
//        // right value when the animation ends.
//        layer.strokeEnd = 1.0
//
//        // Do the actual animation
//        layer.add(animation, forKey: "animateStrokeDrawing")
//    }
