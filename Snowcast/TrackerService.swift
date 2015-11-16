import CoreLocation

class TrackerService: NSObject {

    let locationService = UserLocation()
    internal var trackerMapView: TrackerMapView?

    var currentRun: Run?
    
    override init() {
        super.init()

        locationService.fetch { newLocation in
            self.currentRun = self.currentRun != nil ? self.currentRun?.updatedRun(newLocation) : Run.create(newLocation)
                sendLiveData(currentRun!)
            if let run = self.currentRun {
                self.trackerMapView?.drawLine(run.locations)
            }
        }
    }
    
    func latestRun() -> Run {
        print(self.currentRun?.maxAltitude)
        return self.currentRun!
    }
    
    func sendLiveData(run: Run) {
        let nc = NSNotificationCenter.defaultCenter()
        nc.postNotificationName("locaitonUpdate", object: run)
    }
}