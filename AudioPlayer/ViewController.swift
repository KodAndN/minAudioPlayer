//
//  ViewController.swift
//  AudioPlayer
//
//  Created by Андрей Кодочигов on 22.12.2022.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var valueSlider: UISlider!
    
    @IBOutlet weak var labelView: UILabel!
    
    
    var player = AVAudioPlayer()
    let slider = UISlider()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.slider.frame = CGRect(x: 0, y: 0, width: 200, height: 23)
        self.slider.center = self.view.center
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 100.0
        self.view.addSubview(slider)
        
        self.slider.addTarget(self, action: #selector(changedSlider), for: .valueChanged)

        do {
            if let audioPath = Bundle.main.path(forResource: "WYR_GEMI_-_Black_Samurai_67944226", ofType: "mp3") {
                try player = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath))
                self.slider.maximumValue = Float(player.duration)
            }
        } catch {
            print("Error")
        }
        self.player.play()
    }

    @objc func changedSlider(sender: UISlider) {
        if sender == slider {
            self.player.currentTime = TimeInterval(sender.value)
        }
    }
    
    @IBAction func playButton(_ sender: Any) {
        self.player.play()
    }
    
    @IBAction func stopButton(_ sender: Any) {
        self.player.pause()
        
        
    
    }
    @IBAction func senderAction(_ sender: Any) {
        self.player.volume = self.valueSlider.value
    }
    
}

