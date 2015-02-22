import UIKit

class MasterViewController: UITableViewController, AddItemViewControllerDelegate {
    let defaults = NSUserDefaults.standardUserDefaults()
    var appdelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    var gyaku:[AnyObject] = []
    var objects = NSMutableArray()
    var objects2 = NSMutableArray()
    var array = [AnyObject]()
    var array2 = [AnyObject]()
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("frag"), userInfo: nil, repeats: true)
         NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("stt"), userInfo: nil, repeats: true)
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        //defaults.setObject(array, forKey: "TASKNAME")
        if((defaults.objectForKey("TASKNAME")) != nil){
        var task = defaults.objectForKey("TASKNAME") as? NSArray
            gyaku = task!
            var nameString:AnyObject
            
            for nameString in gyaku{
                //配列に追加していく
                objects2.insertObject(nameString, atIndex: 0)
                
            }
            
            objects.removeAllObjects()
            for nameString in objects2{
                //配列に追加していく
                objects.insertObject(nameString, atIndex: 0)
        }
    }
        if((defaults.objectForKey("TASKNAME")) != nil){
            
            //objectsを配列として確定させ、前回の保存内容を格納
            let objects = defaults.objectForKey("TASKNAME") as? NSArray
            
            //各名前を格納するための変数を宣言
            var nameString:AnyObject
            
            //前回の保存内容が格納された配列の中身を一つずつ取り出す
            for nameString in objects!{
                //配列に追加していく
                array.append(nameString as NSString)
            }
            var count = array.count
            for(var i = 0;i < count;i++){
                if((defaults.stringForKey("\(array[i])")) != nil){
                array2.append(defaults.stringForKey("\(array[i])")!)
                //println("\(array2[i])")
                }
            }
            
        }
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func Alert(){
        defaults.setBool(true, forKey: "FRAG")
        
        if(defaults.boolForKey("FRAG") == true && defaults.integerForKey("locate") == 3){
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("NextViewController") as UIViewController
            
            next.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            
            self.presentViewController(next, animated: true, completion: nil)
            defaults.setBool(false, forKey: "FRAG")
        }
        /*
        UIAlertControllerを作成する.
        let myAlert = UIAlertController(title: "タイトル", message: "メッセージ", preferredStyle: .Alert)
        
        
        // OKのActionを追加する.
        myAlert.addAction(UIAlertAction(title: "OK", style: .Default, handler: {action in self.music() }))
        
        // UIAlertを発動する.
        presentViewController(myAlert, animated: true, completion: nil)
        myAudioPlayer.play()
        */
        
    }
    
    func stt(){
        let now = NSDate()
        let dateFormatter = NSDateFormatter()                                   // フォーマットの取得
        dateFormatter.timeZone = NSTimeZone.localTimeZone()  // JPロケール
        dateFormatter.dateFormat = "yyyy/MM/dd HH:mm"         // フォーマットの指定
        var timenow = dateFormatter.stringFromDate(now);
        var 回数:Int = 0
        for val:AnyObject in array2{
            if(timenow==val as NSString){
                
                appdelegate.lastask = array[回数]
                Alert()
                array2.removeAtIndex(回数)
                
                
                
                
            }
            回数++
        }
        
    }
    
    @IBAction func backMasterViewController(segue:UIStoryboardSegue){
        println(backMasterViewController)
    }
    
    func addItemViewControllerDidCancel(controller: AddItemViewController) -> Void {
        println("addItemViewControllerDidCancel")
        if(appdelegate.sample != nil && appdelegate.sample != ""){
        objects.insertObject(appdelegate.sample!, atIndex: 0)
        appdelegate.sample = ""
        defaults.setObject(objects, forKey: "TASKNAME")
        println("\(objects)")
        let indexPath : NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        dismissViewControllerAnimated(true, completion: nil)
        defaults.setInteger(0, forKey: "frag")
        
        
        if((defaults.objectForKey("TASKNAME")) != nil){
            
            //objectsを配列として確定させ、前回の保存内容を格納
            let objects = defaults.objectForKey("TASKNAME") as? NSArray
            
            //各名前を格納するための変数を宣言
            var nameString:AnyObject
            
            //前回の保存内容が格納された配列の中身を一つずつ取り出す
            for nameString in objects!{
                //配列に追加していく
                array.append(nameString as NSString)
            }
            var count = array.count
            for(var i = 0;i < count;i++){
                array2.removeAll(keepCapacity: true)
                if((defaults.stringForKey("\(array[i])")) != nil){
                    array2.append(defaults.stringForKey("\(array[i])")!)
                    //println("\(array2[i])")
                }
            }
            
        }
        
        if((defaults.objectForKey("TASKNAME")) != nil){
            
            //objectsを配列として確定させ、前回の保存内容を格納
            let objects = defaults.objectForKey("TASKNAME") as? NSArray
            
            //各名前を格納するための変数を宣言
            var nameString:AnyObject
            
            //前回の保存内容が格納された配列の中身を一つずつ取り出す
            array.removeAll(keepCapacity: true)
            for nameString in objects!{
                //配列に追加していく
                array.append(nameString as NSString)
            }
            var count = array.count
            println("\(count)")
            array2.removeAll(keepCapacity: true)
            for(var i = 0;i < count;i++){
                if((defaults.stringForKey("\(array[i])")) != nil){
                    array2.append(defaults.stringForKey("\(array[i])")!)
                    //println("\(array2[i])")
                }
            }
            
        }
        }
        
       
    }
   
    func addItemViewControllerDidFinish(controller: AddItemViewController, item: String) -> Void {
        println("addItemViewControllerDidFinish item: \(item)")
        println("save")
        defaults.setInteger(0, forKey: "frag")
        var savetext : NSMutableArray = [item]
        println("savetextcontent : \(savetext)")
        objects.insertObject(item, atIndex: 0)
        let indexPath : NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        dismissViewControllerAnimated(true, completion: nil)
        defaults.setObject(objects, forKey:"TASKNAME")
        defaults.synchronize()
        if((defaults.objectForKey("TASKNAME")) != nil){
            
            //objectsを配列として確定させ、前回の保存内容を格納
            let objects = defaults.objectForKey("TASKNAME") as? NSArray
            
            //各名前を格納するための変数を宣言
            var nameString:AnyObject
            
            //前回の保存内容が格納された配列の中身を一つずつ取り出す
            for nameString in objects!{
                //配列に追加していく
                array.append(nameString as NSString)
            }
            var count = array.count
            for(var i = 0;i < count;i++){
                if((defaults.stringForKey("\(array[i])")) != nil){
                    array2.append(defaults.stringForKey("\(array[i])")!)
                    //println("\(array2[i])")
                }
            }
            
        }

    }
    
    func frag(){
        
        if(defaults.boolForKey("FRAG") == true && defaults.integerForKey("locate") == 0){
            let storyboard:UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            
            let next:UIViewController = storyboard.instantiateViewControllerWithIdentifier("NextViewController") as UIViewController
            
            next.modalTransitionStyle = UIModalTransitionStyle.CrossDissolve
            
            self.presentViewController(next, animated: true, completion: nil)
            defaults.setBool(false, forKey: "FRAG")
        }
    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowAddItemView" {
            defaults.setInteger(0, forKey: "frag")
            let addItemViewController : AddItemViewController? = segue.destinationViewController.viewControllers?[0] as AddItemViewController?
            addItemViewController!.delegate = self;
        } else if segue.identifier == "showDetail" {
            defaults.setInteger(0, forKey: "frag")
            let indexPath = self.tableView.indexPathForSelectedRow()?.row
            let data = objects[indexPath!] as String
            println(data)
            defaults.setObject(data, forKey:"DETAIL")
           appdelegate.tasktime = defaults.objectForKey("\(data)")
        }
    }
    
    // MARK: - Table View
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return objects.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as UITableViewCell
        
        let object = objects[indexPath.row] as String
        cell.textLabel?.text = object
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            objects.removeObjectAtIndex(indexPath.row)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            defaults.setObject(objects, forKey:"TASKNAME")
            
            defaults.synchronize()
            
            if((defaults.objectForKey("TASKNAME")) != nil){
                
                //objectsを配列として確定させ、前回の保存内容を格納
                let objects = defaults.objectForKey("TASKNAME") as? NSArray
                
                //各名前を格納するための変数を宣言
                var nameString:AnyObject
                
                //前回の保存内容が格納された配列の中身を一つずつ取り出す
                for nameString in objects!{
                    //配列に追加していく
                    array.append(nameString as NSString)
                }
                var count = array.count
                for(var i = 0;i < count;i++){
                    array2.removeAll(keepCapacity: true)
                    if((defaults.stringForKey("\(array[i])")) != nil){
                        array2.append(defaults.stringForKey("\(array[i])")!)
                        //println("\(array2[i])")
                    }
                }
                
            }
            
            if((defaults.objectForKey("TASKNAME")) != nil){
                
                //objectsを配列として確定させ、前回の保存内容を格納
                let objects = defaults.objectForKey("TASKNAME") as? NSArray
                
                //各名前を格納するための変数を宣言
                var nameString:AnyObject
                
                //前回の保存内容が格納された配列の中身を一つずつ取り出す
                array.removeAll(keepCapacity: true)
                for nameString in objects!{
                    //配列に追加していく
                    array.append(nameString as NSString)
                }
                var count = array.count
                println("\(count)")
                array2.removeAll(keepCapacity: true)
                for(var i = 0;i < count;i++){
                    if((defaults.stringForKey("\(array[i])")) != nil){
                        array2.append(defaults.stringForKey("\(array[i])")!)
                        //println("\(array2[i])")
                    }
                }
                
            }

            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}