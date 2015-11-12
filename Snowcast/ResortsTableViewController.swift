import PromiseKit
import UIKit
import CoreLocation

class ResortsTableViewController: UITableViewController {
    
    let resortTableCell = "resortTableCell"
    var requestSnowData: RequestSnowData = RequestSnowData()
    var resortService: ResortService = ResortService()
    var locationService: UserLocation = UserLocation()
    var selectedIndexPath : NSIndexPath?
    let activityIndicator = LoadingIndicator(frame: CGRectMake(0, 0, 60, 60))

    var resorts: Array<ResortPreview> = [] {
        didSet {
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationService.requestLocation()
        activityIndicator.startAnimating()
        
        tableView.registerNib(UINib(nibName: "ResortTableViewCell", bundle: nil), forCellReuseIdentifier: resortTableCell)

        self.observe("locationService.location").then { location in
            return self.resortService.getCoordinates(location)
        }.then { coordinates in
            return self.requestSnowData.fetchConditionsNearUser(coordinates)
        }.then { json in
            return self.resortService.parseResorts(json)
        }.then { resorts -> Void in
            self.activityIndicator.stopAnimating()
            self.resorts = resorts
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resorts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(resortTableCell, forIndexPath: indexPath) as! ResortTableViewCell

        cell.resortNameLabel.text = self.resorts[indexPath.row].name

        return cell
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("resortDetailSegue", sender: tableView)
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "resortDetailSegue") {
            if let resortDetail = segue.destinationViewController as? ResortDetailViewController {
                if let selectedResortIndex = self.tableView.indexPathForSelectedRow?.row {
                    resortDetail.resort = resorts[selectedResortIndex]
                }
            }
        }
    }
    
    func activitiyView() {
        activityIndicator.center = self.view.center
        self.tableView.addSubview(activityIndicator)
        self.tableView.bringSubviewToFront(activityIndicator)
    }
}
