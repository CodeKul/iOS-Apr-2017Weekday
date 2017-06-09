//
//  ViewController.swift
//  MultimediaDemo
//
//  Created by Codekul on 28/02/17.
//  Copyright © 2017 CodeKul. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import MediaPlayer

class ViewController: UIViewController, AVAudioPlayerDelegate {

    var audioPlayer : AVAudioPlayer?
    
    var vdoPlayer : AVPlayer?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let url = URL.init(fileURLWithPath: Bundle.main.path(
            forResource: "Dhaakad",
            ofType: "mp3")!)
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
            audioPlayer?.delegate = self
            audioPlayer?.prepareToPlay()
        } catch let error as NSError {
            print("audioPlayer error \(error.localizedDescription)")
        }
    }

    func audioPlayerDidFinishPlaying(_ player: AVAudioPlayer, successfully
        flag: Bool) {
        
    }
    
    func audioPlayerDecodeErrorDidOccur(_ player: AVAudioPlayer,
                                        error: Error?) {
    }
    
    func audioPlayerBeginInterruption(_ player: AVAudioPlayer) {
        
    }
    
    func audioPlayerEndInterruption(player: AVAudioPlayer) {
        
    }

    @IBAction func playAudio(_ sender: AnyObject) {
        if let player = audioPlayer {
            player.play()
        }
    }
    
    @IBAction func stopAudio(_ sender: AnyObject) {
        if let player = audioPlayer {
            player.stop()
        }
    }
    
    @IBAction func adjustVolume(_ sender: AnyObject) {
        if audioPlayer != nil {
//            audioPlayer?.volume = volumeControl.value
        }
    } 

    @IBAction func playVdo(_ sender:UIButton) {
        
        let urlvdo = URL.init(fileURLWithPath: Bundle.main.path(
            forResource: "spiderman",
            ofType: "mp4")!)
        
        vdoPlayer = AVPlayer(url: urlvdo)
        let playerViewController = AVPlayerViewController()
        playerViewController.player = vdoPlayer

        DispatchQueue.main.async(execute: {
            self.present(playerViewController, animated: true) {
                playerViewController.player?.play()
            }
        })

    }
    @IBAction func stopVdo(_ sender:UIButton) {
        
        DispatchQueue.main.async(execute: {
            self.vdoPlayer?.pause()
        })
        
    }

    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

