import Foundation

class Stopwatch {

    typealias timerUpdateCompletion = (String) -> ()

    var timer = NSTimer()
    var startTime = NSTimeInterval()
    var startDate = NSDate()
    var isRunning = false
    var elapsedTime = NSTimeInterval()
    let timerInterval = 0.1

    func start() {
        let aSelector: Selector = "updateTimer"
        timer = NSTimer.scheduledTimerWithTimeInterval(timerInterval - elapsedTime, target: self, selector: aSelector, userInfo: nil, repeats: true)
        startTime = startDate.timeIntervalSinceReferenceDate
    }

    func stop() {
        timer.invalidate()
        // Save elapsed time to preserve pausing
    }

    
    func updateTimer(completion: timerUpdateCompletion) {
        let currentTime = NSDate.timeIntervalSinceReferenceDate()
        var elapsedTime: NSTimeInterval = currentTime - startTime
        let minutes = UInt8(elapsedTime / 60.0)
        elapsedTime -= (NSTimeInterval(minutes) * 60)
        
        let seconds = UInt8(elapsedTime)
        
        elapsedTime -= NSTimeInterval(seconds)
        
        let fraction = UInt8(elapsedTime * 100)
        
        let strMinutes = String(format: "%02d", minutes)
        let strSeconds = String(format: "%02d", seconds)
        let strFraction = String(format: "%02d", fraction)
        
        let formattedTimerString = "\(strMinutes):\(strSeconds):\(strFraction)"
        
        completion(formattedTimerString)
    }

    deinit {
        self.timer.invalidate()
    }
}