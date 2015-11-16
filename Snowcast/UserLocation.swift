import CoreLocation

class UserLocation: NSObject {
    
    var locationClosure: ((location: CLLocation) -> ())!
    
    private var locationManager = CLLocationManager()
    dynamic var location: CLLocation!

    override init() {
        super.init()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers
        locationManager.delegate = self
        locationManager.pausesLocationUpdatesAutomatically = true
        locationManager.allowsBackgroundLocationUpdates = true
    }

    func fetch(completion: CLLocation -> Void) {
        locationClosure = completion
        startLocationUpdates()
    }
    
    func startLocationUpdates() {
        locationManager.distanceFilter = 10
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
}

extension UserLocation: CLLocationManagerDelegate {
    func locationManager(manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.last
        
        print(location.horizontalAccuracy)
        
        if location.horizontalAccuracy < 16 {
            locationClosure(location: location)
        }
    }

    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
}
