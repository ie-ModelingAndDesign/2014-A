//
//  ViewController.swift
//  ALArM
//
//  Created by okada on 2014/11/15.
//  Copyright (c) 2014年 okada. All rights reserved.
//
//
//  ViewController.swift
//  UIKit025
//


import UIKit
import AVFoundation

class ViewController: UIViewController, UIPickerViewDelegate {
    var emptyarray:[String?] = []
    var myTextField: UITextField!
    var myTextField2: UITextField!
    var myAudioPlayer : AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        
        // DatePickerを生成する.
        var myDatePicker: UIDatePicker = UIDatePicker()
        
        // datePickerを設定（デフォルトでは位置は画面上部）する.
        myDatePicker.frame = CGRectMake(0, self.view.bounds.height/4, 0, 0)
        myDatePicker.timeZone = NSTimeZone.localTimeZone()
        myDatePicker.backgroundColor = UIColor.grayColor()
        myDatePicker.layer.cornerRadius = 5.0
        myDatePicker.layer.shadowOpacity = 0.5
        
        // 値が変わった際のイベントを登録する.
        myDatePicker.addTarget(self, action: "onDidChangeDate:", forControlEvents: .ValueChanged)
        // DataPickerをViewに追加する.
        self.view.addSubview(myDatePicker)
        
        // UITextFieldを作成する.
        myTextField = UITextField(frame: CGRectMake(0,0,200,30))
        myTextField.text = ""
        myTextField.borderStyle = UITextBorderStyle.RoundedRect
        myTextField.layer.position = CGPoint(x: self.view.bounds.width/2,y: self.view.bounds.height - 100);
        
        // UITextFieldをViewに追加する.
        self.view.addSubview(myTextField)
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("stt"), userInfo: nil, repeats: true)
       let soundFilePath : NSString = NSBundle.mainBundle().pathForResource("Sample", ofType: "mp3")!
        let fileURL : NSURL = NSURL(fileURLWithPath: soundFilePath)!
      myAudioPlayer = AVAudioPlayer(contentsOfURL: fileURL, error: nil)
        
        
        
    }
    
    /*
    DatePickerが選ばれた際に呼ばれる.
    */
    func onDidChangeDate(sender: UIDatePicker){
        let myDateFormatter: NSDateFormatter = NSDateFormatter()
        myDateFormatter.dateFormat = "yyyy/MM/dd HH:mm"
        var mySelectedDate: NSString = myDateFormatter.stringFromDate(sender.date)
        myTextField.text = mySelectedDate
        println(mySelectedDate)
        
        
    }
    /*1秒に一回づつ呼ばれる*/
    func stt(){
        let now = NSDate()
        let dateFormatter = NSDateFormatter()                                   // フォーマットの取得
        dateFormatter.timeZone = NSTimeZone.localTimeZone()  // JPロケール
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"         // フォーマットの指定
        var timenow = dateFormatter.stringFromDate(now);
        var 回数:Int = 0
        for val in emptyarray{
        if(timenow==val){
        
            Timer()
            emptyarray.removeAtIndex(回数)
        }
            回数++
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func Timer(){
        
       // UIAlertControllerを作成する.
        let myAlert = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .Alert)
        
    
        // OKのActionを追加する.
        myAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in self.music() }))
        
        // UIAlertを発動する.
        presentViewController(myAlert, animated: true, completion: nil)
       myAudioPlayer.play()
        
    }
    func 確認(){
        let 確認Alert = UIAlertController(title: "確認", message: "この時間に設定しますか?", preferredStyle: .Alert)
        確認Alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in self.myOK() }))
        確認Alert.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: {action in self.myCancel()}))
        presentViewController(確認Alert, animated: true, completion: nil)
        
    }
    @IBAction func pushbutton(sender: AnyObject) {
    確認()
    }
    
    func music() {
           
        
            
            
            myAudioPlayer.stop()
           
        }
    
    
    
    
    
    func myOK(){
        var ok:Int?
        ok = emptyarray.count
        
        
        emptyarray.append(myTextField.text)
        println("\(emptyarray[ok!]) + \(myTextField.text) ")
    println("\(ok!)")
        
    
        }
    

    func myCancel(){}
    func remove(){
        
    }
    
}