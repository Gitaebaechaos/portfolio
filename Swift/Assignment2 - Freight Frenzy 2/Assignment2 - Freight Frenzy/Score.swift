//
//  Score.swift
//  Assignment2 - Freight Frenzy
//
//  Created by 배기태 on 2021/11/05.
//

import UIKit

class Score: NSObject {
    private var storedid: Int32 = 0 
    private var storedteamid: Int32 = 0
    private var storedautonomous: Int32 = 0
    private var storeddrivercontrolled: Int32 = 0
    private var storedendgame: Int32 = 0
    private var storedscore: Int32 = 0
    private var storedlocation: String = ""

    var id: Int32 {
        get { return storedid }
    }
    var teamid: Int32 {
        get { return storedteamid }
    }
    var autonomous: Int32 {
        get { return storedautonomous }
    }
    var drivercontrolled: Int32 {
        get { return storeddrivercontrolled}
    }
    var endgame: Int32 {
        get { return storedendgame }
    }
    var score: Int32 {
        get { return storedscore}
    }
    var location: String {
        get { return storedlocation }
    }

    init(id: Int32, teamid: Int32, autonomous: Int32, drivercontrolled: Int32, endgame: Int32, score: Int32, location: String) {
        super.init()
        
        storedid = id
        storedteamid = teamid
        storedautonomous = autonomous
        storeddrivercontrolled = drivercontrolled
        storedendgame = endgame
        storedscore = score
        storedlocation = location
    }
}
