//
//  EyesLayer.swift
//  drawShapes
//
//  Created by Niklas Danz on 23.01.17.
//  Copyright © 2017 Niklas Danz. All rights reserved.
//

import UIKit

class EyesLayer: CAShapeLayer {
    
    var currentEmotion: Emotion!
    var leftEye: EyeLayer!
    var rightEye: EyeLayer!
    
    init(emotion: Emotion) {
        self.currentEmotion = emotion
        super.init()
        
        leftEye = EyeLayer(emotion: emotion)
        rightEye = EyeLayer(emotion: emotion)
        
        positionEyesOnLayer()
        self.addSublayer(leftEye)
        self.addSublayer(rightEye)
        
        var boundingBox: CGRect = bounds
        for sublayer in sublayers! {
            boundingBox = sublayer.frame.union(boundingBox)
        }
        self.bounds = boundingBox;
        self.position = CGPoint(x: boundingBox.size.width*0.5+lineWidth/2, y: boundingBox.size.height*0.5);
        self.bounds = boundingBox
    }
    
    func positionEyesOnLayer() {
        leftEye.position.x = CGFloat(30.0)
        rightEye.position.x = CGFloat(150.0)
    }
    
    func changeEmotionTo(emotion: Emotion) {
        leftEye.changeEmotionTo(emotion: emotion)
        rightEye.changeEmotionTo(emotion: emotion)
        currentEmotion = emotion
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
