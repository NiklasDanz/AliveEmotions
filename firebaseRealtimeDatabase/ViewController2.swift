//
//  ViewController.swift
//  drawShapes
//
//  Created by Niklas Danz on 17.01.17.
//  Copyright © 2017 Niklas Danz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var currentDrawType = 0
    var face: FaceView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var faceViewContainer: UIView!
    
    @IBAction func redrawTapped(_ sender: Any) {
        currentDrawType += 1
        
        if currentDrawType > 2 {
            currentDrawType = 0
        }
        
        switch currentDrawType {
        case 0:
            face.changeEmotionTo(emotion: .joy)
        case 1:
            face.changeEmotionTo(emotion: .sadness)
        case 2:
            face.changeEmotionTo(emotion: .neutral)
        default:
            break
        }
        
        print(currentDrawType)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize: CGRect = UIScreen.main.bounds
        face = FaceView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        imageView.isHidden = true
        faceViewContainer.addSubview(face as UIView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

