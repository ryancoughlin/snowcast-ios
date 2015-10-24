import PromiseKit
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    
    var locationClosure: ((coordinates: CLLocationCoordinate2D) -> ())?
    private var locationManager = CLLocationManager()
    dynamic var location: CLLocation!
    
    deinit {
        locationManager.delegate = nil
    }
    
    override init() {
        super.init()

        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers

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

}