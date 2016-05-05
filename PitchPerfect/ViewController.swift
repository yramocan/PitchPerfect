//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Yuri Ramocan on 5/5/16.
//  Copyright © 2016 Yuri Ramocan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var i: Int = 0

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
        i += 1
        print("Record button pressed \(i) times");
    }

}

