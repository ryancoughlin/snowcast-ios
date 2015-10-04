import Foundation

let requestSnowData = RequestSnowData()

typealias resortsCompletion = (Array <ResortPreview>) -> ()

class ResortService {
    
    var requestSnowData: RequestSnowData?

    func fetchResorts(completion: resortsCompletion) {
        self.requestSnowData = RequestSnowData()
        
        requestSnowData?.getSnowConditons() { (let json) in
            if let resortsRAW = json["items"] as? Array <Dictionary<String, AnyObject>> {

                let resorts = resortsRAW.map() {
                    ResortPreview(resortDictionary: $0)
                }

                completion(resorts)

            } else {
                print("Error")
            }
        }
    }
}