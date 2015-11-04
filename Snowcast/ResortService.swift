import CoreLocation
import PromiseKit

class ResortService {
    func parseResorts(json: Array <Dictionary <String, AnyObject>>) -> Promise <Array <ResortPreview>> {
        return Promise { fulfill, reject in
            let resorts: Array <ResortPreview> = json.map() {
                ResortPreview(dictionary: $0)
            }
            fulfill(resorts)
        }
    }

    func getCoordinates(location: CLLocation) -> Promise <CLLocationCoordinate2D> {
        return Promise { fulfill, reject in
            let coordinates = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.latitude)
            fulfill(coordinates)
        }
    }
}