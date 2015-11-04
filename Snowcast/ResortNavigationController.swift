import UIKit

@IBDesignable class NavigationBar: UINavigationBar {
    @IBInspectable var backButtonImage: UIImage? {
        didSet {
            self.backIndicatorImage = backButtonImage
            self.backIndicatorTransitionMaskImage = backButtonImage
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.shadowImage = UIImage()
    }
}
