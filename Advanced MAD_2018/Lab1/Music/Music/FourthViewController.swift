//
//  FourthViewController.swift
//  Music
//
//  Created by Maitri Chattopadhyay on 1/30/18.
//  Copyright © 2018 Maitri Chattopadhyay. All rights reserved.
//

import UIKit
import AVFoundation

class FourthViewController: UIViewController, AVAudioPlayerDelegate, AVAudioRecorderDelegate {
    
    var audioPlayer: AVAudioPlayer?
    var audioRecorder: AVAudioRecorder?
    let fileName = "audio.m4a"

    
    @IBOutlet weak var record: UIButton!
    
    @IBOutlet weak var stop: UIButton!
    
    @IBOutlet weak var play: UIButton!
    

    @IBAction func stopButton(_ sender: UIButton) {
        stop.isEnabled = false
        play.isEnabled = true
        record.isEnabled = true
        //stop recording or playing
        if audioRecorder?.isRecording == true
        {
            audioRecorder?.stop()
        } else
        {
            audioPlayer?.stop()
        }
    }
    
    @IBAction func playButton(_ sender: UIButton) {
        // if stopped recording, them play
        if audioRecorder?.isRecording == false
        {
            stop.isEnabled = true
            record.isEnabled = false
            
            do {
                try audioPlayer = AVAudioPlayer(contentsOf:
                    (audioRecorder?.url)!)
                audioPlayer!.delegate = self
                audioPlayer!.prepareToPlay()
             
                audioPlayer!.play() //plays audio
            } catch let error as NSError {
                print("oops error occured!: \(error.localizedDescription)")
            }
        }
    }
    @IBAction func recordButton(_ sender: Any) {
        
        // starts recording
        if audioRecorder?.isRecording == false
        {
            play.isEnabled = false
            stop.isEnabled = true
            audioRecorder?.delegate = self
           
            audioRecorder?.record()
        }

        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        play.isEnabled = false;
        stop.isEnabled = false;
        
        //get path for the audio file
        let dirPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let docDir = dirPath[0] //documents directory
        let audioFileURL = docDir.appendingPathComponent(fileName)
        print(audioFileURL)
        
        let audioSession = AVAudioSession.sharedInstance() //the shared audio session instance
        do {
            // catagories for recording andplayback
            try audioSession.setCategory(AVAudioSessionCategoryPlayAndRecord)
        } catch {
            print("audio session error: \(error.localizedDescription)")
        }
        
        //recorder settings
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC), //specifies audio codec
            AVSampleRateKey: 12000, //sample rate in hertz
            AVNumberOfChannelsKey: 1, //number of channels
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue //audio bit rate
        ]
        
        do {
            //create the AVAudioRecorder instance
            audioRecorder = try AVAudioRecorder(url: audioFileURL, settings: settings)
            audioRecorder?.prepareToRecord()
        } catch {
            print("error: \(error.localizedDescription)")
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func preparexf(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
