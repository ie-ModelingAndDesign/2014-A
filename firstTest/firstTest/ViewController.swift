//
//  ViewController.swift
//  firstTest
//
//  Created by Daigo Shiroma on 2014/11/22.
//  Copyright (c) 2014年 Daigo Shiroma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myLabel2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myLabel.text = "こんにちは！"
        myLabel2.text = "さようなら"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

