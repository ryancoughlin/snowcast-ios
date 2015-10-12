import UIKit

class ResortDetailViewController: UIViewController {

    @IBOutlet weak var resortNameLabel: UILabel!
    @IBOutlet weak var openTrailsView: ResortPieView!
    @IBOutlet weak var openPercentView: ResortPieView!
    @IBOutlet weak var openLiftsView: ResortPieView!
    
    var resort: ResortPreview?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        resortNameLabel?.text = resort?.name
        print(openTrailsView.bounds)
    }
}
