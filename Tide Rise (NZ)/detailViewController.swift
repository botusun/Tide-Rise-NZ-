//
//  detailViewController.swift
//  Tide Rise (NZ)
//
//  Created by Botu Sun on 22/03/16.
//  Copyright © 2016 Botu Sun. All rights reserved.
//

import Foundation
import UIKit
import Charts

class detailViewController: UIViewController, ChartViewDelegate {
    var tideChart = LineChartView()
    var tideTable = UITableView()
    var sampledData = [seaTide]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let selectedBeach = NSUserDefaults.standardUserDefaults().stringForKey("selectedBeach")
        self.title = selectedBeach
        
        let subFrameSize = self.view.frame.size
        let tideFrameSize = (height: subFrameSize.height - 300, width: subFrameSize.width - 20)
        let tideTableSize = (height: 150, width: tideFrameSize.width)
        
        tideChart.frame = CGRect(x: 10, y: 70, width: tideFrameSize.width, height: tideFrameSize.height)
        
        tideChart.descriptionText = ""
        tideChart.delegate = self
        tideChart.gridBackgroundColor = UIColor.blackColor()
        setChartData()
        
        tideChart.xAxis.labelPosition = .Bottom
        
        tideTable.frame = CGRect(x: 10, y: tideFrameSize.height + 50, width: subFrameSize.width - 20, height: 300)
        //tideTable.separatorStyle = .None
        self.view.addSubview(tideChart)
        self.view.addSubview(tideTable)
    }
    
    func setChartData() {
        var yVals: [ChartDataEntry] = [ChartDataEntry]()
        var timeAll: [String] = []
        
        //should fetch data here, using sample data instead
        //initialization sample data
        sampledData.append(seaTide(time: 600, tideHeight: 3.2)!)
        sampledData.append(seaTide(time: 22200, tideHeight: 0.4)!)
        sampledData.append(seaTide(time: 40000, tideHeight: 3.1)!)
        sampledData.append(seaTide(time: 82800, tideHeight: 0.45)!)
        for i in 0 ..< sampledData.count {
            yVals.append(ChartDataEntry(value: sampledData[i].tideHeight, xIndex: i))
            if (sampledData[i].time / 60 / 60) >= 1 {
                
                if ((sampledData[i].time / 60) % 60) < 10 {
                    timeAll += [String(sampledData[i].time / 60 / 60) + ":0" + String((sampledData[i].time / 60) % 60)]
                
                } else {
                    timeAll += [String(sampledData[i].time / 60 / 60) + ":" + String((sampledData[i].time / 60) % 60)]
                }
                
            } else {
                timeAll += [String("0:") + String(sampledData[i].time / 60)]
            }
        }
        
        
        let dataSet = LineChartDataSet(yVals: yVals, label: "Sample Data")
        dataSet.fillColor = UIColor.redColor()
        //var dataSets = [LineChartDataSet]()
        //dataSets.append(dataSet)
        let data = LineChartData(xVals: timeAll, dataSets: [dataSet])
        tideChart.data = data
    }
 
    override func viewWillDisappear(animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

}