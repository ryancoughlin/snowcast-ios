import PromiseKit
import UIKit
import CoreLocation

class ResortsTableViewController: UITableViewController {
    
    typealias JSONDict = Dictionary <String, AnyObject>
    
    let resortTableCell = "resortTableCell"
    let resortService = ResortService()
    let userLocation = LocationService()
    var resorts: Array <ResortPreview> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.resortService.makeSnowConditonRequest().then { (foo: JSONDict) in
            return self.resortService.parseResorts(foo)
        }.then { resorts -> Void in
            self.resorts = resorts
            self.tableView.reloadData()
        }
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return self.resorts.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(resortTableCell, forIndexPath: indexPath)

        cell.textLabel?.text = self.resorts[indexPath.row].name
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
