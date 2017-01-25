//
//  ShowEmojiViewController.swift
//  firebaseRealtimeDatabase
//
//  Created by Niklas Danz on 09/12/2016.
//  Copyright © 2016 Niklas Danz. All rights reserved.
//

import UIKit
import Firebase
import SwiftyJSON

// MARK: Hex Color Methods
extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(netHex:Int) {
        self.init(red:(netHex >> 16) & 0xff, green:(netHex >> 8) & 0xff, blue:netHex & 0xff)
    }
}


// MARK: MAIN CLASS
class ShowEmojiViewController: UIViewController {
    
    @IBOutlet weak var faceViewContainer: UIView!
    @IBOutlet weak var emojiLabel: UILabel!
    let conditionRef = FIRDatabase.database().reference().child("condition")
    var faceView: FaceView!
    
    override func viewDidAppear(_ animated: Bool) {
        // observer
        conditionRef.observe(FIRDataEventType.value, with: { (snapshot) in
            if let emotion = snapshot.value as? String {
                // switch between emotion states
                switch emotion {
                    case "😃":
                        self.view.backgroundColor = UIColor(netHex: 0xfce40a) // Gelb
                        self.faceView.changeEmotionTo(emotion: .joy)
                    case "🙂":
                        self.view.backgroundColor = UIColor(netHex: 0xffeb7f) // Weiß
                        self.faceView.changeEmotionTo(emotion: .neutral)
                    case "😔":
                        self.view.backgroundColor = UIColor(netHex: 0x74776e) // Grau
                        self.faceView.changeEmotionTo(emotion: .sadness)
                    case "😳":
                        self.view.backgroundColor = UIColor(netHex: 0xF9783B) // Orange
                    case "😍":
                        self.view.backgroundColor = UIColor(netHex: 0xe80b3f) // Pink
                    case "😤":
                        self.view.backgroundColor = UIColor(netHex: 0x7f0606) // Dunkelrot
                    default:
                        self.view.backgroundColor = UIColor(netHex: 0xFBFFC6) // Weiß as Default
                }
                self.emojiLabel.text = emotion;
            }
        })
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let screenSize: CGRect = UIScreen.main.bounds
        faceView = FaceView(frame: CGRect(x: 0, y: 0, width: screenSize.width, height: screenSize.height))
        faceViewContainer.addSubview(faceView as UIView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}
