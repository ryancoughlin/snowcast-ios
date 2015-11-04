import Foundation
import CoreLocation

class UserLocation: NSObject, CLLocationManagerDelegate {
    
    private var locationManager = CLLocationManager()
    dynamic var location: CLLocation!

    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.delegate = self
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
    deinit {
        locationManager.delegate = nil
    }
}
