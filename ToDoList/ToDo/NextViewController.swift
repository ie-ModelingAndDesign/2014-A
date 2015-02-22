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
    var appdelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    let myButton: UIButton = UIButton()
    let defaults = NSUserDefaults.standardUserDefaults()
    
    @IBOutlet var task: UILabel!
override func viewDidLoad() {
    
    super.viewDidLoad()
    var a = appdelegate.lastask as String
   task.text = a
    let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("Sample", ofType: "mp3")!
    let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath)!
    myAudioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
    myAudioPlayer.play()

    }
    @IBAction func stopmusic(sender: AnyObject) {
        myAudioPlayer.stop()
        defaults.setBool(false, forKey: "FRAG")
    }
    
    
    
    func onClickMyButton(sender: UIButton){
        println("onClickMyButton:")
        println("sender.currentTitile: \(sender.currentTitle)")
        println("sender.tag:\(sender.tag)")
        
    }
    
    
    
   
    
}