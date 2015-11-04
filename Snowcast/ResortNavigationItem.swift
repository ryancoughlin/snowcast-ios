import UIKit

class ResortNavigationItem: UINavigationItem {

    override func awakeFromNib() {
        super.awakeFromNib()
        
        let logoImageView = UIImageView(frame: CGRectMake(0, 0, 58, 16))
        logoImageView.image = UIImage(named: "logo")
        logoImageView.contentMode = .ScaleAspectFit
        
        self.titleView = logoImageView
        self.backBarButtonItem = UIBarButtonItem(title: "", style: .Plain, target: nil, action: nil)
    }

}
