import UIKit

class LoadingIndicator: UIView {

    @IBOutlet weak var loadingImageView: UIImageView!
    @IBOutlet var loadingIndicatorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()

        setupView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame);

        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);

        setupView()
    }
    
    func setupView() {
        loadingIndicatorView = loadViewFromNib()
        loadingIndicatorView.layer.cornerRadius = 30
        loadingImageView.animationImages = [UIImage]()

        for var index = 0; index < 8; index++ {
            let frameName = String(format: "Loader%1d", index)
            loadingImageView.animationImages?.append(UIImage(named: frameName)!)
        }
        
        loadingImageView.animationDuration = 1
        self.addSubview(loadingIndicatorView)
    }
    
    func startAnimating() {
        loadingImageView.startAnimating()
    }
    
    func stopAnimating() {
        loadingImageView.stopAnimating()
    }
    
    func loadViewFromNib() -> UIView {
        let bundle = NSBundle(forClass:self.dynamicType)
        let nib = UINib(nibName: "LoadingIndicator", bundle: bundle)
        
        return nib.instantiateWithOwner(self, options: nil)[0] as! UIView
    }
}


