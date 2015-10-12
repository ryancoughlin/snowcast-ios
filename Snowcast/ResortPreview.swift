import Foundation

struct ResortPreview {
    
    let name: String

    init(resortDictionary: Dictionary <String, AnyObject>) {
        name = resortDictionary["resortName"] as! String
    }
}