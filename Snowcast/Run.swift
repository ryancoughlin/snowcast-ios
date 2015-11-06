import CoreLocation
import Foundation

struct Run {
    let updateCount: Int
    let lastLocation: CLLocation
    let startDate: NSDate
    let distance: CLLocationDistance
    let duration: NSTimeInterval
    let averageSpeed: Double
    let maxSpeed: Double
    let maxAltitude: Double
    var locations: Array <CLLocationCoordinate2D>
    
    static func create(location: CLLocation) -> Run {
        
        return Run(updateCount: 1,
            lastLocation: location,
            startDate: NSDate(),
            distance: 0,
            duration: NSTimeInterval(),
            averageSpeed: location.speed,
            maxSpeed: location.speed,
            maxAltitude: location.altitude,
            locations: [location.coordinate]
        )
    }
    
    mutating func updatedRun(newLocation: CLLocation) -> Run {
        
        let newDistance = newLocation.distanceFromLocation(lastLocation)
        let newAverageSpeed = weightedAverage(updateCount, currentAverage: averageSpeed, x: newLocation.speed)
        let newMaxSpeed = newLocation.speed > maxSpeed ? newLocation.speed : maxSpeed
        let newMaxAltitude = newLocation.altitude > maxAltitude ? newLocation.altitude : maxAltitude
        let newUpdateCount = updateCount + 1
        let newLocations = locations + [newLocation.coordinate]
        let newDuration = NSDate().timeIntervalSinceDate(startDate)
        
        return Run(updateCount: newUpdateCount,
            lastLocation: newLocation,
            startDate: startDate,
            distance: newDistance,
            duration: newDuration,
            averageSpeed: newAverageSpeed,
            maxSpeed: newMaxSpeed,
            maxAltitude: newMaxAltitude,
            locations: newLocations
        )
    }
}

private func weightedAverage(currentCount: Int, currentAverage: Double, x: Double) -> Double {
    return ((currentAverage * Double(currentCount)) + x) / Double(currentCount + 1)
}

