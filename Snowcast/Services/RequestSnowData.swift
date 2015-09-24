import Foundation
import Alamofire

let SNOCOUNTRY_API_KEY: String = "SnoCountry.example"
let SNOCOUNTRY_BASE_URL: String = "http://feeds.snocountry.net/conditions.php"
let SNOWCOUNTRY_REGION_TYPE: String = "northeast"

class RequestSnowData {
    init() {
        Alamofire.request(.GET, SNOCOUNTRY_BASE_URL, parameters: ["regions":SNOWCOUNTRY_REGION_TYPE, "apiKey":SNOCOUNTRY_API_KEY]).responseJSON { (_, foo, JSON) in
            print(JSON.value)
        }
    }
}