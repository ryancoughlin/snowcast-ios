import PromiseKit
import CoreLocation
import Alamofire

class ResortService {
    
    let API_BASE_URL = "http://localhost:9999/api"
    let API_RETURN_COUNT = "20"
    let API_RETURN_DISTANCE = "20"
    let SNOCOUNTRY_API_ALL_RESULTS = "all_resorts"
    
//    app.get("/api/near/:lng/:lat/:count/:distance", function(req, res) {
    
    var locationService: LocationService?

    func parseResorts(json: Dictionary <String, AnyObject>) -> Promise <Array <ResortPreview>> {
        return Promise { fulfill, reject in
            if let resortsRAW = json["data"] as? Array <Dictionary<String, AnyObject>> {
                let resorts: Array <ResortPreview> = resortsRAW.map() {
                    ResortPreview($0)
                }
                fulfill(resorts)
            } else {
                print("Error")
            }
        } 
    }

    func requestData(location: CLLocationCoordinate2D) -> Promise <Dictionary <String, AnyObject>> {
        return Promise { fulfill, reject in
            Alamofire.request(.GET, nearMeURL(location), parameters: nil).responseJSON { response in
                    switch response.result {
                        
                    case .Success(let value):
                        if let json = value as? Dictionary <String, AnyObject> {
                            fulfill(json)
                        } else {
                            print("Error")
                        }
                        
                    case .Failure(let error):
                        reject(error)
                    }
            }
        }
    }
    
    func getCoordinates(location: CLLocation) -> Promise <CLLocationCoordinate2D> {
        return Promise { fulfill, reject in
            let coordinates = CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.latitude)
            fulfill(coordinates)
        }
    }
    
    func nearMeURL(coordinate: CLLocationCoordinate2D) -> String {
        let longitude = coordinate.longitude.description
        let lattitude = coordinate.latitude.description
        
        let str = "\(API_BASE_URL)/near/\(longitude)/\(lattitude)/\(API_RETURN_COUNT)/\(API_RETURN_DISTANCE)"
        
        return str
    }
}