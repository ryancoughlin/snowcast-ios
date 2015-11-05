import Mapbox
import UIKit

class TrackerViewController: UIViewController {

    @IBOutlet var mapView: TrackerMapView!

    let trackerService = TrackerService()

    override func viewDidLoad() {
        super.viewDidLoad()

        trackerService.trackerMapView = self.mapView
    }
    
    @IBAction func stopTracker(sender: UIButton) {
        trackerService.locationService.stopLocationUpdates()
    }
}
