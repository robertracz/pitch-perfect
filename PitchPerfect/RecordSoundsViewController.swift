//
//  RecordSoundsViewController.swift
//  PitchPerfect
//
//  Created by Robert Bence Racz on 1/29/17.
//  Copyright © 2017 Robert Bence Racz. All rights reserved.
//

import UIKit
import AVFoundation

class RecordSoundsViewController: UIViewController, AVAudioRecorderDelegate {

    @IBOutlet weak var recordingLabel: UILabel!    
    @IBOutlet weak var recordingButton: UIButton!
    @IBOutlet weak var stopRecordingButton: UIButton!
    
    var avAudioRecorder: AVAudioRecorder!
    
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

    @IBAction func recordAudio(_ sender: Any) {
        print("record button was pressed")
        
        recordingLabel.text = "Recording in Progress"
        stopRecordingButton.isEnabled = true;
        recordingButton.isEnabled = false;
        
        recordingLabel.text = "Recording in progress"
        stopRecordingButton.isEnabled = true
        recordingButton.isEnabled = false
        
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory,.userDomainMask, true)[0] as String
        let recordingName = "recordedVoice.wav"
        let pathArray = [dirPath, recordingName]
        let filePath = URL(string: pathArray.joined(separator: "/"))
        
        print(filePath)
        
        let session = AVAudioSession.sharedInstance()
        try! session.setCategory(AVAudioSessionCategoryPlayAndRecord, with:AVAudioSessionCategoryOptions.defaultToSpeaker)
        
        try! avAudioRecorder = AVAudioRecorder(url: filePath!, settings: [:])
        avAudioRecorder.delegate = self;
        avAudioRecorder.isMeteringEnabled = true
        avAudioRecorder.prepareToRecord()
        avAudioRecorder.record()
    }
    

    @IBAction func stopRecording(_ sender: Any) {
        print("stop recording button was pressed")
        
        recordingLabel.text = "Tap to Record"
        stopRecordingButton.isEnabled = false;
        recordingButton.isEnabled = true;
        
        avAudioRecorder.stop();
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setActive(false)
    }
    
    func audioRecorderDidFinishRecording(_ recorder: AVAudioRecorder, successfully flag: Bool) {
        print("finished recording")
        if flag {
            performSegue(withIdentifier: "stopRecording", sender: avAudioRecorder.url)
        } else {
            print("recording failed")
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "stopRecording"{
            let playSoundsVC = segue.destination as! PlaySoundsViewController
            let recordAudio = sender as! URL
            playSoundsVC.recordedAudioURL = recordAudio
        }
    }
}

