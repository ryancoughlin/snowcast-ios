import UIKit

class TrackerViewController: UIViewController {
    let stopwatch = Stopwatch()

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var trackerButton: FlatButton!
        
    @IBAction func startTimer(sender: FlatButton) {
        stopwatch.start()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
