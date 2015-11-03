import UIKit

@IBDesignable class ResortDetailViewController: UIViewController {

    @IBOutlet weak var snowLevelsView: SnowLevelsView!
    @IBOutlet weak var resortNameLabel: UILabel!
    
    var resort: ResortPreview?
    let baseDepth: CGFloat = 100
    let newSnow: Float = 12
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resortNameLabel?.text = resort?.name
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let heightsFromAPI = Heights.init(newSnow: 2, baseDepth: 60)
        let scaledHeights = heightsFromAPI * scaleFactor
        print(scaledHeights)

        self.snowLevelsView.baseHeight.constant = CGFloat(scaledHeights.baseDepth)
        self.snowLevelsView.newSnow24Height.constant = CGFloat(scaledHeights.newSnow)

        UIView.animateWithDuration(1, delay: 0.75, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.45, options: [], animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
}
