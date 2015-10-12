import UIKit

class ResortsTableViewController: UITableViewController {
    
    let resortTableCell = "resortTableCell"
    let showResortDetailSegue = "showResortDetailSegue"
    
    var resortService: ResortService?
    var resorts: Array<ResortPreview> = []

    override func viewDidLoad() {
        super.viewDidLoad()

        self.resortService = ResortService()
        
        self.resortService?.fetchResorts() { (let resorts) in
            self.resorts = resorts
            self.tableView.reloadData()
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
        let cell = tableView.dequeueReusableCellWithIdentifier(resortTableCell, forIndexPath: indexPath)

        cell.textLabel?.text = self.resorts[indexPath.row].name

        return cell
    }

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "showResortDetailSegue") {
            if let resortDetail = segue.destinationViewController as? ResortDetailViewController {
                if let selectedResortIndex = self.tableView.indexPathForSelectedRow?.row {
                    resortDetail.resort = resorts[selectedResortIndex]
                }
            }
        }
    }
}
