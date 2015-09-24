import CoreLocation
import UIKit

class ViewController: UIViewController {
    
    var locationController: UserLocation?
    var requestSnowData: RequestSnowData?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationController = UserLocation()
        self.locationController?.startLocationUpdates()
        self.requestSnowData = RequestSnowData()
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "foo:", name: "userLocation", object: nil)
    }
    
    func foo(sender: CLLocation) {

    }

}
