//
//  ViewController.swift
//  PitchPerfect
//
//  Copyright © 2016 Yuri Ramocan. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioRecorderDelegate {
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(animated: Bool) {
        stopButton.layer.borderColor = blackColor.CGColor
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAudio(sender: AnyObject) {
        // Record audio when Record button is pressed.
        recordLabel.text = "Recording..." // Change label text when Record button is tapped.
        toggleButton(recordButton) // Disable and hide Record button
        toggleButton(stopButton) // Enable and show Stop button
        
        print("Record button pressed") // Primitive debugging
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        recordLabel.text = "Record your voice"
        toggleButton(stopButton) // Disable and hide Stop Button
        toggleButton(recordButton) // Enable and show Record button
        
        // Perform manual segue to PlaybackViewController
        performSegueWithIdentifier("toPlayback", sender: nil)
        
        print("Stop button pressed") // Primitive debugging
    }
    
    // MARK: Helper Functions
    
    func toggleButton(button: UIButton) {
        button.enabled = !button.enabled
        button.hidden = !button.hidden
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

