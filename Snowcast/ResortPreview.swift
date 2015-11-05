struct ResortPreview {

    var name: String = "Resort Name"
    var baseDepth: Float = 0
    var newSnow24: Float = 10
    var scaledBaseDepth: Float = 50
    var baseDepthString: String {
        get {
            return String(format: "%2d\"", baseDepth)
        }
    }

    var newSnow24String: String {
        get {
            return String(format: "%2d\"", newSnow24)
        }
    }

    init(dictionary: Dictionary <String, AnyObject>) {

        if let resortName = dictionary["name"] as? String {
            self.name = resortName
        }
        
        if let baseDepth = dictionary["avgBaseDepthMax"] as? Float {
            self.baseDepth = baseDepth
        }
        
        if let base = dictionary["newSnowMax"] as? Float {
            self.newSnow24 = base
        }
        
        let heightsFromAPI = Heights.init(newSnow: self.newSnow24, baseDepth: self.baseDepth)
        let scaledHeights = heightsFromAPI * scaleFactor
        print(scaledHeights)
    }
}