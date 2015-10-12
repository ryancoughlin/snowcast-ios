import Foundation
import Alamofire

let SNOCOUNTRY_API_KEY: String = "SnoCountry.example"
let SNOCOUNTRY_BASE_URL: String = "http://feeds.snocountry.net/conditions.php"
let SNOWCOUNTRY_REGION_TYPE: String = "northeast"

typealias snowConditionCompletion = (Dictionary <String, AnyObject>) -> ()
typealias weatherCompletion = (Dictionary <String, AnyObject>) -> ()

class RequestSnowData {
    
    func getSnowConditons(completion: snowConditionCompletion) {
//        Alamofire.request(.GET, SNOCOUNTRY_BASE_URL, parameters: ["regions":SNOWCOUNTRY_REGION_TYPE, "apiKey":SNOCOUNTRY_API_KEY])
//            .responseJSON {(request, response, result) in
//                
//                if let json = result.value as? Dictionary <String, AnyObject> {
//                    completion(json)
//                } else {
//                    print("Error")
//                }
//        }
    }
    
    func getWeatherData(completion: weatherCompletion) {
        
    }
}