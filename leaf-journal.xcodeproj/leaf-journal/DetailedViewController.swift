import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var dateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let selectedDate = UserDefaults.standard.string(forKey: "selectedDate") {
            dateLabel.text = selectedDate
        }
    }
    
}
