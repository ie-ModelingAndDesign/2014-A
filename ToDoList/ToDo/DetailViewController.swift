import UIKit

class DetailViewController: UIViewController {
<<<<<<< HEAD
    @IBOutlet weak var paramLabel: UILabel!
    
    var param:String = "init param"
    
=======
    
    @IBOutlet weak var paramLabel: UILabel!
    let defaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        super.viewDidLoad()
 var task = defaults.objectForKey("DETAIL") as String?
        paramLabel.text = task
    }
>>>>>>> origin/shiroma
}

