import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var paramLabel: UILabel!
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
 var task = defaults.objectForKey("DETAIL") as String?
        paramLabel.text = task
    }
}

