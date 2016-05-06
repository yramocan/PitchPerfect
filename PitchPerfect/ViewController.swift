//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Yuri Ramocan on 5/5/16.
//  Copyright © 2016 Yuri Ramocan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    
    var recordingState: Bool = false

    @IBAction func recordAudio(sender: AnyObject) {
        // Record audio when Record button is pressed.
        
        if !recordingState {
            recordLabel.text = "Recording..." // Change label text when Record button is tapped.
            setStopButton(recordButton)
        } else {
            recordLabel.text = "Record your voice"
            setRecButton(recordButton)
        }
        
        recordingState = !recordingState
        
        printAndIncrement() // Primitive debugging
    }
    
    
    // MARK: Helper Functions
    
    var i: Int = 0 // Initialize counter variable for debugging.
    
    func printAndIncrement() {
        i += 1
        print("Record button pressed \(i) times")
    }
    
    func setStopButton(button: UIButton) {
        button.layer.borderWidth = 1.0
        button.layer.borderColor = blackColor.CGColor
        button.setTitleColor(blackColor, forState: .Normal)
        button.backgroundColor = UIColor.clearColor()
        button.setTitle("Stop", forState: .Normal)
    }
    
    func setRecButton(button: UIButton) {
        button.layer.borderWidth = 0
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.backgroundColor = redColor
        button.setTitle("Record", forState: .Normal)
    }

}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        let newRed = CGFloat(red)/255
        let newGreen = CGFloat(green)/255
        let newBlue = CGFloat(blue)/255
        
        self.init(red: newRed, green: newGreen, blue: newBlue, alpha: 1.0)
    }
}

let redColor = UIColor(red: 213, green: 76, blue: 78)
let blackColor = UIColor(red: 39, green: 39, blue: 39)

