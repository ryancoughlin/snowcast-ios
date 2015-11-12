import UIKit
import Charts

class RunViewController: UIViewController, ChartViewDelegate {
    
    @IBOutlet weak var lineChartView: LineChartView!
    
    var run: Run?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lineChartView.delegate = self
        lineChartView.descriptionText = "";
        lineChartView.noDataTextDescription = "Data will be loaded soon."
        lineChartView.maxVisibleValueCount = 60
        lineChartView.pinchZoomEnabled = false
        lineChartView.drawGridBackgroundEnabled = true
        lineChartView.drawBordersEnabled = false
        lineChartView.highlightPerTapEnabled = false
        lineChartView.highlightPerDragEnabled = false
        lineChartView.borderLineWidth = 10
        
        let xAxis = lineChartView.rightAxis
        xAxis.drawGridLinesEnabled = false
        xAxis.drawLabelsEnabled = false
        
        let yAxis = lineChartView.leftAxis
        yAxis.drawGridLinesEnabled = false
        yAxis.drawLabelsEnabled = false
        
        
        lineChartView.xAxis.drawGridLinesEnabled = false
        
        let speed = run?.loc.map {
            return $0.speed
        }
        
        let altitude = run?.loc.map {
            return $0.altitude
        }
        
        let time = run?.loc.map {
            return $0.timestamp
        }
        
        setChart(time!, values: speed!)
    }
    
    func setChart(dataPoints: [NSDate], altitude: [Double], speed: [Double]) {
        
        var dataEntries: [ChartDataEntry] = []
        
        for i in 0..< dataPoints.count {
            let dataEntry = ChartDataEntry(value: values[i], xIndex: i)
            dataEntries.append(dataEntry)
        }

        let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: "Units Sold")
        let lineChartData = LineChartData(xVals: dataPoints, dataSet: lineChartDataSet)

        
        lineChartView.drawGridBackgroundEnabled = false
        lineChartDataSet.drawCubicEnabled = true
        lineChartDataSet.lineWidth = 2
        lineChartView.data = lineChartData
        lineChartView.animate(xAxisDuration: 3, yAxisDuration: 3)
    }
}
