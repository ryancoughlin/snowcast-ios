import UIKit

@IBDesignable class ResortDetailViewController: UIViewController {

    @IBOutlet weak var snowLevelsView: SnowLevelsView!
    @IBOutlet weak var resortNameLabel: UILabel!
    
    var resort: ResortPreview?
    
    let newSnow: Float = 12
    var baseDepth: CGFloat {
        get {
            return scaledBaseHeight()
        }
        
        set {
            return scaledBaseHeight(newValue)
        }
    }

    let multiplier: CGFloat = 12
    let screenHeight = UIScreen.mainScreen().bounds.height
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resortNameLabel?.text = resort?.name
        
        baseDepth = 10
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        self.snowLevelsView.baseHeight.constant = baseDepth
        print(self.snowLevelsView.baseHeight.constant)
        self.snowLevelsView.newSnow24Height.constant = getNewSnowHeight(newSnow)

        UIView.animateWithDuration(1, delay: 0.75, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.45, options: [], animations: {
            
            self.view.layoutIfNeeded()
            
            }, completion: nil)
    }
    
    func getNewSnowHeight(newSnow: Float) -> CGFloat {
        let scaled = newSnow
        let foo = (scaled / 33.9674) * 100
        print("New snow height:", scaled, foo)
        
        return CGFloat(foo)
    }
    
    func scaledBaseHeight() -> CGFloat {
        let scaled = baseDepth * multiplier
        let foo = ((scaled / screenHeight) * 100)
        print(scaled, foo)
        
        return foo
    }
}
