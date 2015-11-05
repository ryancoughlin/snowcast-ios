import Foundation
import CoreLocation

class UserLocation: NSObject, CLLocationManagerDelegate {
    
    var locationClosure: ((location: CLLocation) -> ())!
    
    private var locationManager = CLLocationManager()
    dynamic var location: CLLocation!

    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.delegate = self
    }
    
    func startLocationUpdates() {
        locationManager.distanceFilter = 6
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.activityType = CLActivityType.Fitness
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    func stopLocationUpdates() {
        locationManager.stopUpdatingLocation()
    }
    
    func requestLocation() {
        locationManager.requestWhenInUseAuthorization()
        locationManager.requestLocation()
    }
    
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
        locationClosure(location: location)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
    deinit {
        locationManager.delegate = nil
    }
    
    func fetch(completion: CLLocation -> Void) {
        locationClosure = completion
    }
}
