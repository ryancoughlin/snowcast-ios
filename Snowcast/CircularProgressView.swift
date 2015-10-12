import UIKit

class CircularProgressView: UIView {

    let progressLayer = CircularProgressLayer()
    var progress: CGFloat = 0
    let progressColor = UIColor.blueColor()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.progressLayer.frame = self.frame
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setup()
    }
    
    func setup() {
        self.layer.addSublayer(progressLayer)
        backgroundColor = UIColor.cyanColor()
    }
    
}