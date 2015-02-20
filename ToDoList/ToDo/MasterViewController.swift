import UIKit

class MasterViewController: UITableViewController, AddItemViewControllerDelegate {
    let defaults = NSUserDefaults.standardUserDefaults()
    var gyaku:[AnyObject] = []
    var objects = NSMutableArray()
    var objects2 = NSMutableArray()
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        if((defaults.objectForKey("NAME")) != nil){
        var task = defaults.objectForKey("NAME") as? NSArray
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
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backMasterViewController(segue:UIStoryboardSegue){
        println(backMasterViewController)
    }
    
    func addItemViewControllerDidCancel(controller: AddItemViewController) -> Void {
        println("addItemViewControllerDidCancel")
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func addItemViewControllerDidFinish(controller: AddItemViewController, item: String) -> Void {
        println("addItemViewControllerDidFinish item: \(item)")
        var savetext : NSMutableArray = [item]
        println("savetextcontent : \(savetext)")
        objects.insertObject(item, atIndex: 0)
        let indexPath : NSIndexPath = NSIndexPath(forRow: 0, inSection: 0)
        self.tableView.insertRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
        dismissViewControllerAnimated(true, completion: nil)
        defaults.setObject(objects, forKey:"NAME")
        defaults.synchronize()


    }
    
    // MARK: - Segues
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowAddItemView" {
            let addItemViewController : AddItemViewController? = segue.destinationViewController.viewControllers?[0] as AddItemViewController?
            addItemViewController!.delegate = self;
        } else if segue.identifier == "showDetail" {
            let indexPath = self.tableView.indexPathForSelectedRow()?.row
            let data = objects[indexPath!] as String
            println(data)
            defaults.setObject(data, forKey:"DETAIL")
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
            defaults.setObject(objects, forKey:"NAME")
            defaults.synchronize()

            
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
        }
    }
}