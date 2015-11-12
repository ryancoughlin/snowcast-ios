import Foundation
import UIKit

@IBDesignable class PhraseLabel: UILabel {
    
    override var text: String! {
        didSet {
            styleLabel()
        }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        styleLabel()
    }
    
    func styleLabel() {
        let paragraphStyle = NSMutableParagraphStyle()
        let attributedText = NSMutableAttributedString(string: text)
        
        paragraphStyle.lineSpacing = -30
        attributedText.addAttribute(NSParagraphStyleAttributeName, value:paragraphStyle, range:NSMakeRange(0, attributedText.length))
        
        self.attributedText = attributedText
    }
}