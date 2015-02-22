import UIKit

class AddItemViewController : UITableViewController {
    let defaults = NSUserDefaults.standardUserDefaults()
    var appdelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    override func viewDidLoad() {
        super.viewDidLoad()
       
        defaults.setInteger(2, forKey: "locate")
    }
    @IBAction func clickedSaveButton(sender: AnyObject) {
        println("clickedSaveButton")
        self.delegate?.addItemViewControllerDidFinish(self, item:self.textLabel.text)
        defaults.setInteger(0, forKey: "locate")
    }

    @IBAction func gotoAlerm(sender: AnyObject) {
        
        appdelegate.sample = textLabel.text
        
    }
    @IBAction func clickedCancelButton(sender: AnyObject) {
        println("clickedcancelButton")
        self.delegate?.addItemViewControllerDidCancel(self)
        defaults.setInteger(0, forKey: "locate")
    }
    
    @IBAction func backAlarmViewController(segue:UIStoryboardSegue){
        println("backItemViewController")
        defaults.setInteger(2, forKey: "locate")
    }
    
    @IBOutlet weak var textLabel: UITextField!
    
    var delegate: AddItemViewControllerDelegate!

    
    
}
protocol AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(controller: AddItemViewController) -> ()
    func addItemViewControllerDidFinish(controller:AddItemViewController, item: String) -> ()
}