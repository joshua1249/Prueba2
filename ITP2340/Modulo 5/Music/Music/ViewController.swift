//
//  ViewController.swift
//  Music
// Joshua Juarbe - ITP2340 - EDP University
   
//  Created by Joshua Miranda on 4/23/20.
//  Copyright © 2020 Joshua Miranda. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet var playButton: UIButton!
    
    @IBOutlet var playLocal: UIButton!
    
    var playerItem:AVPlayer?
    
    var player:AVPlayer?
    
    var audioPlayer:AVAudioPlayer!
    
    var audioFlag:Bool! = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url;(string: "https://s3.amazonaws.com/kargopolov/kukushka.mp3)
            
            playerItem = AVPlayerItem(url: url!)
        
            player = AVPlayer(playerItem: playerItem!)
        
        let playerLayer = AVPlayerLayer(player: player!)
        
        playerLayer.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        self.view.layer.addSublayer(playerLayer)
        
        playButton.addTarget(self, action: #selector(ViewController.playButtonTapped(_:)), for: .touchUpInside)
        playLocal.addTarget(self, action: #selector(ViewController.playButtonLocal(_:)), for: .touchUpInside)
        
        // Do any additional setup after loading the view.
    }

    @objc func playButtonLocal(_ ender: AnyObject) {
        let audioFileURL = Bundle.main.url(forResource: "aurora", withExtension: "mp3")
        
        if audioFileURL != nil {
            do {
                try audioPlayer = AVAudioPlayer(contentsOf: audioFileURL!)
            } catch let error as NSError {
                print (error.localizedDescription)
            } catch {
                print ("ERROR AVAudioPlayer !!!")
            }
        }
        
        print ("EHM -->> audioPlayer?.rate = ")
        
        print (audioPlayer?.rate as Any)
        
        if audioFlag == false {
            
            audioFlag = true
            audioPlayer.play()
            playLocal.setTitle("Pause Local Music", for: UIControl.State())
            playLocal.setTitleColor(UIColor.green, for: UIControl.State())
            
        } else {
            
            audioFlag = false
            audioPlayer.play()
            playLocal.setTitle("Pause Local Music", for: UIControl.State())
            playLocal.setTitleColor(UIColor.green, for: UIControl.State())
            
            
        }
    }
    
    func playbuttonTapped(_ sender: AnyObject) {
        if player?.rate == 0 {
            
            player!.play()
            playButton.setImage(UIImage(named: "pause-button-red.png), for: UIControlState()), for: <#UIControl.State#>, for: <#UIControl.State#>, for: <#UIControl.State#>, for: <#UIControl.State#>, for: <#UIControl.State#>)))
            
        }; esle {
             
            player!.pause()
            playButton.setImage(UIImage(named: "pause-button-green.png), for: UIControlState())
            
            
        }
    }

    func finishedPlaying(_ myNotification: Notification) {
        playButton.setImage(UIImage(named: "play-button.png:), for: UIControlStat(), for: <#UIControl.State#>)
        let stopedPlayerItem: AVPlayerItem = myNotification.object as! AVPLayerItem;: stopedPlayerItem.seek(to: kCMTimeZero)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NotificationCenter.default.addObserver(self, selector: Selector(("finishedPlaying")), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: playerItem)
    }
    override func viewWillDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self)
        
    }
    
    override func didRecieveMemoryWarning() {
        
        super.didRecieveMemoryWarning()
        
    }
}

// intente de arreglar los errores pero no se que es lo que estoy haciendo mal :(
