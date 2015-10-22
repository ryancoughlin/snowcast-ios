import PromiseKit
import CoreLocation

class LocationService: NSObject, CLLocationManagerDelegate {
    
    var locationClosure: ((coordinates: CLLocationCoordinate2D) -> ())?

    private var locationManager = CLLocationManager()
    
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
        if let locationCoordinates = locations.last?.coordinate {
        
            
            
            locationClosure!(coordinates: locationCoordinates)
        }
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError) {
        print(error)
    }
    
//    func fetchLocations(completion: CLLocationCoordinate2D -> Promise <Void>) {
//        locationClosure = completion
//
//        return completion
//        
//        requestLocation()
//    }
}