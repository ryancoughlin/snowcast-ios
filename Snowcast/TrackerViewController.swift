import Mapbox
import UIKit

class TrackerViewController: UIViewController {

    @IBOutlet var mapView: TrackerMapView!

    let trackerService = TrackerService()

    override func viewDidLoad() {
        super.viewDidLoad()

        trackerService.trackerMapView = self.mapView
    }
    
    @IBAction func startTracker(sender: UIButton) {
        trackerService.locationService.startLocationUpdates()
    }

    @IBAction func dismiss() {
        dismissViewControllerAnimated(true, completion: nil)
    }

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showLatestRun") {
            trackerService.locationService.stopLocationUpdates()
            if let latestRun = segue.destinationViewController as? RunViewController
            {
                latestRun.run = trackerService.currentRun
            }
        }
    }
}
