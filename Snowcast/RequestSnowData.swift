import Alamofire

let SNOCOUNTRY_BASE_URL: String = "http://localhost:9999/api/all_resorts"
let SNOCOUNTRY_API_ALL_RESULTS: String = "all_resorts"
let SNOCOUNTRY_API_FIND_NEAR_USER: String = "near/"

// "/api/near/:lng/:lat/:count/:distance"

typealias snowConditionCompletion = (Dictionary <String, AnyObject>) -> ()

class RequestSnowData {
    
    func getSnowConditons(completion: snowConditionCompletion) {
        Alamofire.request(.GET, SNOCOUNTRY_BASE_URL, parameters: nil)
            .responseJSON { response in

                switch response.result {

                case .Success(let value):
                    if let json = value as? Dictionary <String, AnyObject> {
                        completion(json)
                    } else {
                        print("Error")
                    }

                case .Failure(let error):
                    print(error)
                }
        }
    }
}