import Mapbox
import UIKit
import CoreLocation

class TrackerMapView: MGLMapView {

    var coordinates: Array <CLLocationCoordinate2D> = []

    override func awakeFromNib() {
        super.awakeFromNib()
        self.delegate = self

        self.styleURL = NSURL(string: "asset://styles/dark-v8.json")
    }
    
    func drawLine(coordinates: Array <CLLocationCoordinate2D>) {
        self.setCenterCoordinate(coordinates.last!, zoomLevel: 14, animated: true)
        
        let count = coordinates.count
        self.coordinates = coordinates

        let polyline = MGLPolyline(coordinates: &self.coordinates, count: UInt(count))
        
        dispatch_async(dispatch_get_main_queue(), { [unowned self] in
            self.addAnnotation(polyline)
        })
    }
}

extension TrackerMapView: MGLMapViewDelegate {

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
