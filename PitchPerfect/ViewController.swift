//
//  ViewController.swift
//  PitchPerfect
//
//  Created by Robert Bence Racz on 1/29/17.
//  Copyright © 2017 Robert Bence Racz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var recordingLabel: UILabel!    
    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        stopRecordingButton.isEnabled = false;
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("viewWillAppear called")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func recordAutio(_ sender: Any) {
        print("record button was pressed")
        
        recordingLabel.text = "Recording in Progress"
        stopRecordingButton.isEnabled = true;
        recordingButton.isEnabled = false;
    }

    @IBAction func stopRecording(_ sender: Any) {
        print("stop recording button was pressed")
        
        recordingLabel.text = "Tap to Record"
        stopRecordingButton.isEnabled = false;
        recordingButton.isEnabled = true;
    }
}

