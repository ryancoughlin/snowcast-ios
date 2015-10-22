import PromiseKit
import CoreLocation
import Alamofire

class ResortService {
    
    let API_BASE_URL = "http://localhost:9999/api/all_resorts"
    let API_RETURN_COUNT = "20"
    let API_RETURN_DISTANCE = "50"
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

    func makeSnowConditonRequest() -> Promise <Dictionary <String, AnyObject>> {
        
        return Promise { fulfill, reject in

            Alamofire.request(.GET, API_BASE_URL, parameters: nil).responseJSON { response in
                    switch response.result {
                        
                    case .Success(let value):
                        if let json = value as? Dictionary <String, AnyObject> {
                            fulfill(json)
                        } else {
                            print("Error")
                        }
                        
                    case .Failure(let error):
                        print(error)
                    }
            }
        }
    }
    
    func apiCall(type: AnyObject) -> String {
        return "\(API_BASE_URL)\(type)"
    }
    
    func resortsNearMeQueryString(coordinate: CLLocationCoordinate2D) -> String {
        let longitude = coordinate.longitude.description
        let lattitude = coordinate.latitude.description
        
        return "/api/near/\(longitude)/\(lattitude)/\(API_RETURN_COUNT)/\(API_RETURN_DISTANCE)"
    }
}