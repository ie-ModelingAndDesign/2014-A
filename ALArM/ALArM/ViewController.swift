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
import CoreData
import Foundation

class ViewController: UIViewController, UIPickerViewDelegate {
    var array = [AnyObject]()
    var myTextField: UITextField!
    var myAudioPlayer : AVAudioPlayer!
    let defaults = NSUserDefaults.standardUserDefaults()
    
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
        
        
        
    
    
        //空の配列を用意
        
        
        //前回の保存内容があるかどうかを判定
        if((defaults.objectForKey("NAME")) != nil){
            
            //objectsを配列として確定させ、前回の保存内容を格納
            let objects = defaults.objectForKey("NAME") as? NSArray
            
            //各名前を格納するための変数を宣言
            var nameString:AnyObject
            
            //前回の保存内容が格納された配列の中身を一つずつ取り出す
            for nameString in objects!{
                //配列に追加していく
                array.append(nameString as NSString)
            }
        }
        
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
        for val:AnyObject in array{
        if(timenow==val as NSString){
        
            Alert()
            array.removeAtIndex(回数)
        }
            回数++
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func Alert(){
        
       // UIAlertControllerを作成する.
        let myAlert = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .Alert)
        
    
        // OKのActionを追加する.
        myAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in self.music() }))
        
        // UIAlertを発動する.
        presentViewController(myAlert, animated: true, completion: nil)
       myAudioPlayer.play()
        
    }
    func 確認(){
        //保存の際の確認
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
        array = array as NSArray
        var ok:Int?
        ok = array.count
        
        
       // println("\(array[ok!]) + \(myTextField.text) ")
    println("\(ok!)")
        let arr1 = myTextField.text.componentsSeparatedByString("/")
        let arr2 = arr1[2].componentsSeparatedByString(" ")
        let arr3 = arr2[1].componentsSeparatedByString(":")
        
        var arr = arr3[1].toInt()
        var arr4 = arr3[0].toInt()
        if (arr<30){
        arr = 30-arr!
        arr = 60-arr!
        arr4 = arr4!-1
        var asa3 = arr4!
        var asa2 = arr!
            var last:NSString = arr1[0] + "/\(arr1[1])" + "/\(arr2[0])" + " \(asa3)" + ":\(asa2)"
        println("\(last)")
        array.append(last)
            
        }else{
           var asa = arr!-30
            var asa4 = arr4!
            if(asa<10){
            var last2:NSString = arr1[0] + "/\(arr1[1])" + "/\(arr2[0])" + " \(asa4)" + ":0\(asa)"
            println("\(last2)")
                array.append(last2)}
            else{
                var last3:NSString = arr1[0] + "/\(arr1[1])" + "/\(arr2[0])" + " \(asa4)" + ":\(asa)"
                println("\(last3)")
                array.append(last3)
            }
        }
       
        defaults.setObject(array, forKey:"NAME")
        defaults.synchronize()
    }
    

    func myCancel(){}
    func remove(){
        
    }
    
}