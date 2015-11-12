import PromiseKit
import CoreLocation
import Alamofire

let BASE_URL: String = "https://boiling-harbor-8062.herokuapp.com/api/near/"

class RequestSnowData {
    func fetchConditionsNearUser(location: CLLocationCoordinate2D) -> Promise <Array <Dictionary <String, AnyObject>>> {
        return Promise { fulfill, reject in

            let longitude = location.longitude
            let latitude = location.latitude
            let limit = 10
            let distance = 10
            
            let parameters: Dictionary <String, AnyObject> = ["longitude":longitude, "latitude":latitude, "limit":limit, "distance":distance]

            Alamofire.request(.GET, BASE_URL, parameters: parameters).responseJSON { response in
                switch response.result {
                case .Success(let value):
                    if let json = value["data"] as? Array <Dictionary <String, AnyObject>> {
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
}