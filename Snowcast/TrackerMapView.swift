import Mapbox
import UIKit

class TrackerMapView: MGLMapView {
    
    let trackerService = TrackerService()

    override func awakeFromNib() {
        super.awakeFromNib()

        self.styleURL = NSURL(string: "asset://styles/dark-v8.json")
    }
    
    func drawLine() {
        self.setCenterCoordinate(self.trackerService.coordinates.last!, zoomLevel: 14, animated: true)
        
        let count = self.trackerService.coordinates.count
        let polyline = MGLPolyline(coordinates: &self.trackerService.coordinates, count: UInt(count))
        
        dispatch_async(dispatch_get_main_queue(), { [unowned self] in
            self.addAnnotation(polyline)
        })
    }

    func mapView(mapView: MGLMapView, alphaForShapeAnnotation annotation: MGLShape) -> CGFloat {
        return 1
    }
    
    func mapView(mapView: MGLMapView, lineWidthForPolylineAnnotation annotation: MGLPolyline) -> CGFloat {
        return 2.0
    }
    
    func mapView(mapView: MGLMapView, strokeColorForShapeAnnotation annotation: MGLShape) -> UIColor {
        return UIColor.cyanColor()
    }
    
    func mapView(mapView: MGLMapView, fillColorForPolygonAnnotation annotation: MGLPolygon) -> UIColor {
        return UIColor.cyanColor()
    }
}
