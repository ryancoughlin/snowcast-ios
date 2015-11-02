import QuartzCore
import UIKit

class CircularProgressLayer: CAShapeLayer {

    var progress: CGFloat = 0 {
        didSet {
            self.strokeEnd = self.progress
            print("Value of progess in setter: \(progress)")
        }
    }
    
    override init() {
        super.init()
        styleProgressLayer()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        styleProgressLayer()
    }
    
    func styleProgressLayer() {
        lineWidth = 2
        lineCap = kCALineCapRound
        borderColor = UIColor.blueColor().CGColor
        fillColor = UIColor.redColor().CGColor
        backgroundColor = UIColor.clearColor().CGColor
        strokeEnd = 1
    }
    
    func degreesToRadians (value:Double) -> Double {
        return value * M_PI / 180.0
    }
    
    override func layoutSublayers() {
        super.layoutSublayers()
        let center = CGPoint(x: super.bounds.midX, y: super.bounds.midY)
        let radius = min(super.bounds.width, super.bounds.height) / 2 - self.lineWidth / 2
        
        let startAngle = CGFloat(-M_PI_2)
        let endAngle = startAngle + CGFloat(M_PI * 2)
        let path = UIBezierPath(arcCenter: CGPointZero, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        
        self.position = center
        self.path = path.CGPath
    }
}