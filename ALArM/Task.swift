//
//  Task.swift
//  ALArM
//
//  Created by okada on 2014/12/18.
//  Copyright (c) 2014年 okada. All rights reserved.
//

import UIKit
import CoreData

@objc(Task)
class Task: NSManagedObject {
    
    @NSManaged var memo:String
    @NSManaged var date:NSDate
}
