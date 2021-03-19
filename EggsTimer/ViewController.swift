//
//  ViewController.swift
//  EggsTimer
//
//  Created by Анастасия Ларина on 23.12.2020.
//

import UIKit
import AVFoundation

//let softTime = 5
//let mediumTime = 8
//let hardTime = 12

//Dictionary

class ViewController: UIViewController {
    
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    var player: AVAudioPlayer!
    var tamerLabel :String?
    var changeLabel = "Done!"
    let eggTimes = ["Soft": 10, "Medium": 20, "Hard": 30]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardnes = sender.currentTitle! // Soft, Medium, Hard
        totalTime = eggTimes[hardnes]!
        
        progressBar.progress = 0.0
        secondsPassed = 0
        timerLabel.text = hardnes
        
        timer = Timer.scheduledTimer (timeInterval: 1.0, target:self, selector: #selector(updateTimer), userInfo:nil, repeats: true)
        
        progressBar.setProgress(0, animated: true)
        
    }
    
    
    @objc func updateTimer() {
        if secondsPassed < totalTime {
            secondsPassed += 1
            progressBar.progress = Float(secondsPassed) / Float(totalTime)
            
            
        } else {
            timer.invalidate()
            timerLabel.text = changeLabel
            
            let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player.play()        }
        
    }
}

//        if hardnes != nil {
//            print(eggTimes[hardnes!]!)
//        }


