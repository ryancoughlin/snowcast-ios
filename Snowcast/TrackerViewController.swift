import Mapbox
import UIKit

class TrackerViewController: UIViewController {

    let trackerService = TrackerService()

    override func viewDidLoad() {
        super.viewDidLoad()

        trackerService.startTracking()
    }
    
    @IBAction func stopTracker(sender: UIButton) {
        trackerService.stopTracking()
    }
}
