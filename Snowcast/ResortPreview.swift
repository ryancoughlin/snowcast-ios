import Foundation

struct ResortPreview {
    
    let resortName: String

    init(resortDictionary: Dictionary <String, AnyObject>) {
        print(resortDictionary)
        resortName = resortDictionary["name"] as! String
    }
}