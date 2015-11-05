import CoreLocation

class TrackerService: NSObject {

    let locationService = UserLocation()
    internal var trackerMapView: TrackerMapView?

    var currentRun: Run?
    
    override init() {
        super.init()

        locationService.fetch { newLocation in
            self.currentRun = self.currentRun != nil ? self.currentRun?.updatedRun(newLocation) : Run.create(newLocation)
            if let run = self.currentRun {

                self.trackerMapView?.drawLine(run.locations)
            }
        }
    }

}