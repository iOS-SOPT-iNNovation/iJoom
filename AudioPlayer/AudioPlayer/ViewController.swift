//
//  ViewController.swift
//  AudioPlayer
//
//  Created by IJ . on 2020/05/13.
//  Copyright © 2020 jun. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate {
    
    @IBOutlet weak var perSongButton: UIButton!
    @IBOutlet weak var nextSongButton: UIButton!
    @IBOutlet weak var musicSlider: UISlider!
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var musicPlayPauseButton: UIButton!
    var avPlayer: AVAudioPlayer!
    var timer: Timer!
    var song = ["1","2","3"]
    var count: Int = 0
    //https://stackoverflow.com/questions/30214187/make-a-playlist-start-next-song-in-swift
    //다음 곡
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializePlayer()
        
        musicPlayPauseButton.addTarget(self, action: #selector(playAndPause), for: UIControl.Event.touchUpInside)
        
             self.musicSlider.value = Float(self.avPlayer.currentTime)
        
    }
    
    
    func initializePlayer() {
        
//        guard let soundAsset: NSDataAsset = NSDataAsset(name: "\(song[count])") else {
//            print("음원 파일 없습니다.")
//            return
//        }
//
//        do {
//            try self.avPlayer = AVAudioPlayer(data: soundAsset.data)
//            self.avPlayer.delegate = self
//        } catch let error as NSError {
//            print("플레이어 초기화 실패")
//            print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
//        }
        
        
        
        //MARK: error -- iOS 13 can't return URL?
                let audioPath = Bundle.main.path(forResource: "2", ofType: "mp3")!
                let audioUrl = URL(fileURLWithPath: audioPath)
                //mainBundle.pathForResource("\(song[counter])", ofType: "mp3")!
        
               // avPlayer = AVAudioPlayer(contentsOf: NSURL(string: audioPath))
                do{
                    avPlayer = try AVAudioPlayer(contentsOf: audioUrl)
        
                }catch let error as NSError{
                    print("코드 : \(error.code), 메세지 : \(error.localizedDescription)")
                }
        
        
//                let path = Bundle.main.path(forResource: "Future Islands - Tin Man", ofType: "mp3")!
//                let url = URL(fileURLWithPath: path)
//
//                do {
//                    audioPlayer =  try AVAudioPlayer(contentsOf: url)
//                } catch {
//                    // can't load file
//                }
        
        
        
        
        
        
        self.musicSlider.maximumValue = Float(self.avPlayer.duration)
        self.musicSlider.minimumValue = 0
        self.musicSlider.value = Float(self.avPlayer.currentTime)
    }
    
    @IBAction func playAndPause(_ sender: UIButton){
        sender.isSelected = !sender.isSelected
        
        if sender.isSelected
        {
            self.avPlayer?.play()
            
        }
        else {
            self.avPlayer?.pause()
        }
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    @objc func updateTime() {
        let currentTime = Int(avPlayer.currentTime)
        let minutes = currentTime/60
        let seconds = currentTime - minutes * 60
        
        timeLabel.text = String(format: "%02d:%02d", minutes,seconds) as String
    }
    @IBAction func touchUpNextSongButton(_ sender: UIButton) {
        print("nextSong")
        if count<2{
            count+=1
        }else{
            count=0
        }
        
        initializePlayer()
        self.avPlayer?.play()
        
        
    }
    
    @IBAction func touchUpPreSongButton(_ sender: UIButton) {
        print("PreSong")
        
        if count>0{
            count -= 1
        }else {
            count = 2
        }
        
        initializePlayer()
        self.avPlayer?.play()
    }
    
    @IBAction func valueChangeMusicSlider(_ sender: UISlider) {
        
        if sender.isTracking{ return}
        //progressSlider.setValue(sender.value, animated: true)
        self.avPlayer.currentTime = TimeInterval(sender.value)
        
    }
    
    
    
}
