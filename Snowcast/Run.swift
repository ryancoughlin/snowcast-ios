import CoreLocation
import Foundation

struct Run {
    let updateCount: Int
    let lastLocation: CLLocation
    let date: NSDate
    let distance: CLLocationDistance
    let averageSpeed: Double
    let maxSpeed: Double
    let maxAltitude: Double
    var locations: Array <CLLocationCoordinate2D>
    
    static func create(location: CLLocation) -> Run {
        
        return Run(updateCount: 1,
            lastLocation: location,
            date: NSDate(),
            distance: 0,
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
        
        return Run(updateCount: newUpdateCount,
            lastLocation: newLocation,
            date: date,
            distance: newDistance,
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

