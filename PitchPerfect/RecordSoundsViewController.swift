//
//  ViewController.swift
//  PitchPerfect
//
//  Copyright © 2016 Yuri Ramocan. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {
    @IBOutlet weak var recordLabel: UILabel!
    @IBOutlet weak var recordButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    
    var audioRecorder: AVAudioRecorder!

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
        recordLabel.text = "Recording..." // Change label text when Record button is tapped.
        toggleButton(recordButton) // Disable and hide Record button
        toggleButton(stopButton) // Enable and show Stop button
        
        // Record audio when Record button is tapped.
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = NSURL.fileURLWithPathComponents(pathArray)
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
        
        try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
        audioRecorder.delegate = self
        audioRecorder.meteringEnabled = true
        audioRecorder.prepareToRecord()
        audioRecorder.record()
        
        print("Record button pressed.") // Primitive debugging
    }
    
    @IBAction func stopRecording(sender: AnyObject) {
        // Stop audio recording when Stop button is tapped.
        audioRecorder.stop()
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
        
        recordLabel.text = "Record your voice"
        toggleButton(stopButton) // Disable and hide Stop Button
        toggleButton(recordButton) // Enable and show Record button
        
        print("Stop button pressed.") // Primitive debugging
    }
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder, successfully flag: Bool) {
        if flag {
            // Perform manual segue to PlaybackViewController.
            performSegueWithIdentifier("toPlayback", sender: audioRecorder.url)
        } else {
            // If saving recording failed, then print error to console.
            print("Recording could not be saved.")
        }
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toPlayback" {
            let playSoundsVC = segue.destinationViewController as! PlaySoundsViewController
            let recordedAudioURL = sender as! NSURL
            playSoundsVC.recordedAudioURL = recordedAudioURL
        }
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

