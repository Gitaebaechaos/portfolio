//
//  ScoreKeep.swift
//  Assignment2 - Freight Frenzy
//
//  Created by 배기태 on 2021/11/04.
//

import Foundation
import UIKit

class ScoreKeep: NSObject {
    static let shared = ScoreKeep()
    
    var ducksDeliveredEndGame: Int = 0
    var hubBalancedEndGame: Bool = false
    var hubCappedEndGame: Bool = false
    var hubTippedEndGame: Bool = false
    var partiallyWarehouseEndGame: Bool = false
    var completelyWarehouseEndGame: Bool = false
    var storageUnitDriverControlledPeriod: Int = 0
    var hubLevel1DriverControlledPeriod: Int = 0
    var hubLevel2DriverControlledPeriod: Int = 0
    var hubLevel3DriverControlledPeriod: Int = 0
    var allianceHubDriverControlledPeriod: Int = 0
    var duckDeliveredAutonomous: Bool = false
    var storageUnitAutonomous: Bool = false
    var shippingHubAutonomous: Bool = false
    var usedDuckAutonomous: Bool = false
    var usedTeamScoringElementAutonomous: Bool = false
    var alliancePartiallyAutonomous: Bool = false
    var allianceCompletelyAutonomous: Bool = false
    var warehousePartiallyAutonomous: Bool = false
    var warehouseCompletelyAutonomous: Bool = false
    
    private var auto: Int = 0
    
    var autonomous: Int {
        get { return auto }
        set(newValue) { auto = newValue }
    }
    private var driver: Int = 0
    
    var driverControlledPeriod: Int {
        get { return driver }
        set(newValue) { driver = newValue }
    }
    
    private var end: Int = 0
    
    var endGame: Int {
        get { return end }
        set(newValue) { end = newValue }
    }
    
    var record: Int {
        get { return auto + driver + end}
    }
    
    override init() {
        super.init()
    }
    
}
