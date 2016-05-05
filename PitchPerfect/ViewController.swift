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

    @IBAction func recordAudio(sender: AnyObject) {
        // Record audio when Record button is pressed.
        
        printAndIncrement() // Primitive debugging
    }
    
    
    // MARK: Helper Functions
    
    var i: Int = 0 // Initialize counter variable for debugging
    
    func printAndIncrement() {
        i += 1
        print("Record button pressed \(i) times")
    }

}

