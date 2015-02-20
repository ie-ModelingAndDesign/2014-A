//
//  NextViewController.swift
//  ToDo
//
//  Created by okada on 2015/02/19.
//  Copyright (c) 2015年 Andgenie Co., Ltd. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation
class MusicController: UIViewController{
    var myAudioPlayer : AVAudioPlayer!
    let myButton: UIButton = UIButton()
override func viewDidLoad() {
    
    super.viewDidLoad()
    
    let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("Sample", ofType: "mp3")!
    let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath)!
    myAudioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
    myAudioPlayer.play()

    }
    @IBAction func stopmusic(sender: AnyObject) {
        myAudioPlayer.stop()
    }
    
    func onClickMyButton(sender: UIButton){
        println("onClickMyButton:")
        println("sender.currentTitile: \(sender.currentTitle)")
        println("sender.tag:\(sender.tag)")
        
    }
    
   
    
}