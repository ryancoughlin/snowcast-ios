import UIKit

@IBDesignable class SnowLevelsView: UIView {

    @IBOutlet weak var baseHeight: NSLayoutConstraint!
    @IBOutlet weak var newSnow24Height: NSLayoutConstraint!
    
    @IBOutlet var snowLevelsView: UIView!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        setupNib()
    }
    
    func setupNib() {
        snowLevelsView = loadViewFromNib()
        snowLevelsView.frame = bounds
        snowLevelsView.autoresizingMask = [.FlexibleWidth, .FlexibleHeight]
        self.addSubview(snowLevelsView);
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "SnowLevelsView", bundle: bundle)
        print(nib)
        let view = nib.instantiateWithOwner(self, options: nil)[0] as! UIView
        
        return view
    }
}