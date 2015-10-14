import UIKit

@IBDesignable class FlatButton: UIButton {
    @IBInspectable var fillColor: UIColor = UIColor.blueColor() {
        didSet {
            layer.backgroundColor = fillColor.CGColor
        }
    }
    
    @IBInspectable var titleColor: UIColor = UIColor.whiteColor() {
        didSet {
            self.setTitleColor(titleColor, forState: .Normal)
        }
    }
}
    