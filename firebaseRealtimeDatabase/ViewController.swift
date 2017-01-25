//
//  ViewController.swift
//  firebaseRealtimeDatabase
//
//  Created by Niklas Danz on 06/12/2016.
//  Copyright © 2016 Niklas Danz. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase
import SwiftyJSON

class ViewController: UIViewController {
    
    let conditionRef = FIRDatabase.database().reference().child("condition")
    let usersRef = FIRDatabase.database().reference().child("users")
    
    @IBOutlet weak var textLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        // observer
        conditionRef.observe(FIRDataEventType.value, with: { (snapshot) in
            if let bla = snapshot.value as? String {
                self.textLabel.text = bla
            }
        })
        usersRef.observe(FIRDataEventType.value, with: { (snapshot) in
            let json = JSON(snapshot.value!)
            print(json[0]["name"].stringValue)
            print(json[0]["condition"].stringValue)
        })
    }
    
    @IBAction func smileNormalButtonTouched(_ sender: UIButton) {
        conditionRef.setValue("🙂")
    }
    @IBAction func surprisedButtonTouched(_ sender: UIButton) {
        conditionRef.setValue("😳")
    }
    @IBAction func inLoveButtonTouched(_ sender: UIButton) {
        conditionRef.setValue("😍")
    }
    @IBAction func angryButtonTouched(_ sender: UIButton) {
        conditionRef.setValue("😤")
    }
    
    @IBAction func sunnyButtonTouched(_ sender: UIButton) {
        conditionRef.setValue("😃")
    }
    @IBAction func foggyButtonTouched(_ sender: UIButton) {
        conditionRef.setValue("😔")
    }
    
}

