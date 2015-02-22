import UIKit

class DetailViewController: UIViewController {
    var appdelegate: AppDelegate = UIApplication.sharedApplication().delegate as AppDelegate
    @IBOutlet var label: UILabel!
    @IBOutlet weak var paramLabel: UILabel!
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.setInteger(1, forKey: "locate")
 var task = defaults.objectForKey("DETAIL") as String?
        paramLabel.text = task
        label.text = appdelegate.tasktime as String?
        println("\(task)")
    }
    
}

