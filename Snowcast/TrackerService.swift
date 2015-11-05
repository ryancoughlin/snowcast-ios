import CoreLocation

class TrackerService: NSObject {

    let locationService = UserLocation()
    let trackerMapView = TrackerMapView()
    var currentRun: Run?
    var coordinates: Array <CLLocationCoordinate2D> = []
    
    override init() {
        super.init()

        locationService.fetch { newLocation in
            self.currentRun = self.currentRun != nil ? self.currentRun?.updatedRun(newLocation) : Run.create(newLocation)
            self.trackerMapView.drawLine()
            self.coordinates = (self.currentRun?.locations)!
        }
    }
    
    func stopTracking() {
        locationService.stopLocationUpdates()
    }

    func startTracking() {
        locationService.startLocationUpdates()
    }
}