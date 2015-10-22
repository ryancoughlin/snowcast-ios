import CoreLocation

struct ResortPreview {
    
    let name: String
    let lattitude: CLLocationDegrees
    let longitude: CLLocationDegrees
    var location: CLLocationCoordinate2D = CLLocationCoordinate2DMake(0, 0)

    init(_ dictionary: Dictionary <String, AnyObject>) {
        name = dictionary["name"] as! String
        lattitude = dictionary["lattitude"] as! CLLocationDegrees
        longitude = dictionary["longitude"] as! CLLocationDegrees
        location = createLocation(lattitude, longitude)
    }
    
    private func createLocation(lat: CLLocationDegrees, _ lon: CLLocationDegrees) -> CLLocationCoordinate2D {
        return CLLocationCoordinate2DMake(lat, lon)
    }
}