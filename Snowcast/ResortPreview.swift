import Foundation

struct ResortPreview {
    
    let name: String
    let type: String
    let openTrails: String
    let openLifts: String

    init(resortDictionary: Dictionary <String, AnyObject>) {
        name = resortDictionary["resortName"] as! String
        type = resortDictionary["resortType"] as! String
        openTrails = resortDictionary["maxOpenDownHillTrails"] as! String
        openLifts = resortDictionary["maxOpenDownHillLifts"] as! String
        
    }
}