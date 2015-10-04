import Argo
import Foundation

struct ResortPreview {
    let id: Int
    let resortName: String
    let resortType: String
}

extension ResortPreview: Decodable {
    static func decode(j: JSON) -> Decoded<ResortPreview> {
        return curry(ResortPreview.init)
            <^> j <| "id"
            <*> j <| "resortName"
            <*> j <| "resortType"
    }
}

