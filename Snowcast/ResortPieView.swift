import Foundation
import UIKit

class ResortPieView: UIView {

    let circularProgessViewNib = "CircularProgressViewNib"
    
    @IBOutlet weak var pieImage: UIImageView!
    @IBOutlet weak var progressView: CircularProgressView!
    @IBOutlet weak var pieLabel: UILabel!
    @IBOutlet weak var pieLabelValue: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNib()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!    
        if (self.subviews.count == 0) {
            setupNib()
        }
    }
    
    func setupNib() {
        let view = NSBundle.mainBundle().loadNibNamed(circularProgessViewNib, owner: self, options: nil)[0] as! ResortPieView
        self.addSubview(view);
        self.autoresizingMask = self.autoresizingMask;
        self.translatesAutoresizingMaskIntoConstraints = false;
        self.clipsToBounds = true
        print(self.bounds)
    }
}

