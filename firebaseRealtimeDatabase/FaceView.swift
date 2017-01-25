//
//  faceView.swift
//  drawShapes
//
//  Created by Niklas Danz on 18.01.17.
//  Copyright © 2017 Niklas Danz. All rights reserved.
//

import UIKit

class FaceView: UIView {
    
    // MARK: Variables
    
    var currentEmotion: Emotion!
    var mouthLayer: MouthLayer!
    var eyesLayer: EyesLayer!
    
    // MARK: Initialisers

    override init(frame: CGRect) {
        currentEmotion = Emotion.neutral
        mouthLayer = MouthLayer(emotion: .neutral)
        eyesLayer = EyesLayer(emotion: .neutral)
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.black
        
        // Mouth
        
        let mouthWrapperLayer = CAShapeLayer()
        mouthWrapperLayer.addSublayer(mouthLayer)
        // center mouth layer
        mouthWrapperLayer.position.x = (frame.width/2 - mouthLayer.bounds.width/2)
        mouthWrapperLayer.position.y = frame.height*(2/4);
        // add mouth layer to main layer
        layer.addSublayer(mouthWrapperLayer)
        
        // Eyes
        
        let eyesWrapper = CAShapeLayer()
        eyesWrapper.addSublayer(eyesLayer)
        // center eyes layer
        eyesWrapper.position.x = (frame.width/2 - eyesLayer.bounds.width/2)
        eyesWrapper.position.y = frame.height*(1/4);
        // add mouth layer to main layer
        layer.addSublayer(eyesWrapper)
        
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Functions
    
    func changeEmotionTo(emotion: Emotion) {
        
        switch emotion {
        case .joy:
            eyesLayer.changeEmotionTo(emotion: .joy)
            mouthLayer.changeEmotionTo(emotion: .joy)
        case .neutral:
            eyesLayer.changeEmotionTo(emotion: .neutral)
            mouthLayer.changeEmotionTo(emotion: .neutral)
        case .sadness:
            eyesLayer.changeEmotionTo(emotion: .sadness)
            mouthLayer.changeEmotionTo(emotion: .sadness)
        default:
            print("I'm also neutral.")
        }
        
        currentEmotion = emotion
    }

}
