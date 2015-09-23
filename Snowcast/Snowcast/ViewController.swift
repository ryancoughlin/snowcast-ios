import CoreLocation
import UIKit

class ViewController: UIViewController {
    
    var locationController: UserLocation?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.locationController = UserLocation()
        self.locationController?.startLocationUpdates()
    
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "foo:", name: "userLocation", object: nil)
    }
    
    func foo(sender: CLLocation) {
        print(sender)
    }

}
