import UIKit

@IBDesignable class ResortDetailViewController: UIViewController {

    @IBOutlet weak var snowLevelsView: SnowLevelsView!
    @IBOutlet weak var resortNameLabel: UILabel!
    @IBOutlet weak var phraseLabel: UILabel!

    var resort: ResortPreview!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resortNameLabel.text = resort.name
        phraseLabel.text = "We can hope for snow"
        snowLevelsView.newSnow24Label.text = resort.newSnow24String
        snowLevelsView.baseDepthLabel.text = resort.baseDepthString
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    
        self.snowLevelsView.baseHeight.constant = CGFloat(self.resort.scaledBaseDepth)
        self.snowLevelsView.newSnow24Height.constant = CGFloat(self.resort.newSnow24)

        UIView.animateWithDuration(1, delay: 0.75, usingSpringWithDamping: 0.35, initialSpringVelocity: 0.45, options: [], animations: {
            
            self.view.layoutIfNeeded()
            
        }, completion: nil)
    }
}
