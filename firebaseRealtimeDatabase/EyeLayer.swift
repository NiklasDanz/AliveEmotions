//
//  EyeLayer.swift
//  drawShapes
//
//  Created by Niklas Danz on 24.01.17.
//  Copyright © 2017 Niklas Danz. All rights reserved.
//

import UIKit

class EyeLayer: CAShapeLayer {

    var currentEmotion: Emotion!
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    init(emotion: Emotion) {
        super.init()
        
        path = eyePath(emotion: emotion)
        position = CGPoint(x: 0, y: 0)
        //contentsScale = 0.5
        changeEmotionTo(emotion: emotion)
        lineWidth = 5.0;
        
        let r = path!.boundingBox;
        bounds = r;
        position = CGPoint(x: r.size.width*0.5+lineWidth/2, y: r.size.height*0.5);
        bounds = path!.boundingBox
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func changeEmotionTo(emotion: Emotion) {
        switch emotion {
        case .joy:
            animateToPath(path: eyePath(emotion: .joy), duration: 0.5)
            strokeColor = UIColor.alive.yellow.cgColor
            fillColor = UIColor.alive.yellow.cgColor
        case .neutral:
            animateToPath(path: eyePath(emotion: .neutral), duration: 0.5) // JOY
            strokeColor = UIColor.alive.white.cgColor
            fillColor = UIColor.alive.white.cgColor
        case .sadness:
            animateToPath(path: eyePath(emotion: .sadness), duration: 0.5) // JOY
            strokeColor = UIColor.alive.blue.cgColor
            fillColor = UIColor.alive.blue.cgColor
        default:
            print("I'm also neutral.")
        }
        
        currentEmotion = emotion
    }
    
    func eyePath(emotion: Emotion) -> CGPath {
        switch emotion {
        case .joy:
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: CGFloat(30), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
            return circlePath.cgPath
        case .neutral:
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: CGFloat(30), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
            return circlePath.cgPath
        case .sadness:
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: CGFloat(30), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
            return circlePath.cgPath
        default:
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: CGFloat(30), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
            return circlePath.cgPath
        }
        
    }
    
    
}
