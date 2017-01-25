//
//  MouthLayer.swift
//  drawShapes
//
//  Created by Niklas Danz on 25.01.17.
//  Copyright © 2017 Niklas Danz. All rights reserved.
//

import UIKit

class MouthLayer: CAShapeLayer {
    
    var currentEmotion: Emotion!
    
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    init(emotion: Emotion) {
        super.init()
        
        path = mouthPath(emotion: emotion)
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
            animateToPath(path: mouthPath(emotion: .joy), duration: 0.5)
            strokeColor = UIColor.alive.yellow.cgColor
        case .neutral:
            animateToPath(path: mouthPath(emotion: .neutral), duration: 0.5) // JOY
            strokeColor = UIColor.alive.white.cgColor
        case .sadness:
            animateToPath(path: mouthPath(emotion: .sadness), duration: 0.5) // JOY
            strokeColor = UIColor.alive.blue.cgColor
        default:
            print("I'm also neutral.")
        }
        
        currentEmotion = emotion
    }
    
    func mouthPath(emotion: Emotion) -> CGPath {
        switch emotion {
        case .joy:
            let path: UIBezierPath = UIBezierPath()
            
            let width: CGFloat = 200.0
            let height: CGFloat = 80.0
            let biegungMitte: CGFloat = 80.0
            let biegungAussen: CGFloat = 40.0
            
            path.move(to: CGPoint(x: width, y: 0.0))
            //path.addLine(to: CGPoint(x: width, y: 0))
            path.addCurve(to: CGPoint(x: width/2, y: height),
                          controlPoint1: CGPoint(x: width, y: biegungAussen), // x= x; y= y-40
                controlPoint2: CGPoint(x: width/2+biegungMitte, y: height)) // x= 150+80; y= y
            path.addCurve(to: CGPoint(x: 0, y: 0),
                          controlPoint1: CGPoint(x: width/2-biegungMitte, y: height), // x= 150-80; y= y
                controlPoint2: CGPoint(x: 0, y: biegungAussen))  // x=x; y= y-40
            
            //path.close()
            path.lineWidth = 5
            //path.fill()
            path.stroke()
            
            return path.cgPath
        case .neutral:
            let path: UIBezierPath = UIBezierPath()
            
            let width: CGFloat = 200.0
            let height: CGFloat = 20.0
            let biegungMitte: CGFloat = 80.0
            let biegungAussen: CGFloat = 40.0
            
            path.move(to: CGPoint(x: width, y: 0.0))
            //path.addLine(to: CGPoint(x: width, y: 0))
            
            path.addCurve(to: CGPoint(x: width/2, y: height),
                          controlPoint1: CGPoint(x: width, y: biegungAussen), // x= x; y= y-40
                controlPoint2: CGPoint(x: width/2+biegungMitte, y: height)) // x= 150+80; y= y
            path.addCurve(to: CGPoint(x: 0, y: 0),
                          controlPoint1: CGPoint(x: width/2-biegungMitte, y: height), // x= 150-80; y= y
                controlPoint2: CGPoint(x: 0, y: biegungAussen))  // x=x; y= y-40
            
            //path.close()
            path.lineWidth = 5
            //path.fill()
            path.stroke()
            
            return path.cgPath;
        case .sadness:
            let path: UIBezierPath = UIBezierPath()
            
            let width: CGFloat = 200.0
            let height: CGFloat = 80.0
            let biegungMitte: CGFloat = 80.0
            let biegungAussen: CGFloat = 40.0
            
            path.move(to: CGPoint(x: width, y: 0))
            //path.addLine(to: CGPoint(x: width, y: 0))
            
            path.addCurve(to: CGPoint(x: width/2, y: height),
                          controlPoint1: CGPoint(x: width, y: biegungAussen), // x= x; y= y-40
                controlPoint2: CGPoint(x: width/2+biegungMitte, y: height)) // x= 150+80; y= y
            path.addCurve(to: CGPoint(x: 0, y: 0),
                          controlPoint1: CGPoint(x: width/2-biegungMitte, y: height), // x= 150-80; y= y
                controlPoint2: CGPoint(x: 0, y: biegungAussen))  // x=x; y= y-40
            
            // mirror path
            let mirrorOverX = CGAffineTransform.init(scaleX: 1.0, y: -1.0)
            let translate = CGAffineTransform.init(translationX: 0, y: path.bounds.height)
            
            path.apply(mirrorOverX)
            path.apply(translate)
            
            //path.close()
            path.lineWidth = 5
            //path.fill()
            path.stroke()
            
            return path.cgPath;
        default:
            let circlePath = UIBezierPath(arcCenter: CGPoint(x: 100,y: 100), radius: CGFloat(30), startAngle: CGFloat(0), endAngle:CGFloat(M_PI * 2), clockwise: true)
            return circlePath.cgPath
        }
        
    }
    
}
