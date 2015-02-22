import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var paramLabel: UILabel!
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
        defaults.setInteger(1, forKey: "locate")
 var task = defaults.objectForKey("DETAIL") as String?
        paramLabel.text = task
    }
    
}

