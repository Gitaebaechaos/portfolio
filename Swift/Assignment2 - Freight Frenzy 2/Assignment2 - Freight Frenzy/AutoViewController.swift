//
//  AutoViewController.swift
//  Assignment2 - Freight Frenzy
//
//  Created by 배기태 on 2021/11/02.
//

import UIKit

class AutoViewController: UIViewController {

    @IBOutlet weak var duckDelivered: UISwitch!
    @IBOutlet weak var alliancePartially: UISwitch!
    @IBOutlet weak var allianceCompletely: UISwitch!
    @IBOutlet weak var warehousePartially: UISwitch!
    @IBOutlet weak var warehouseCompletely: UISwitch!
    @IBOutlet weak var storageUnit: UISwitch!
    @IBOutlet weak var shippingHub: UISwitch!
    @IBOutlet weak var usedDuck: UISwitch!
    @IBOutlet weak var usedTeamScoring: UISwitch!
    @IBOutlet weak var reset: UIBarButtonItem!
    @IBOutlet weak var doScore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        duckDelivered.isOn = Bool(ScoreKeep.shared.duckDeliveredAutonomous)
        storageUnit.isOn = Bool(ScoreKeep.shared.storageUnitAutonomous)
        shippingHub.isOn = Bool(ScoreKeep.shared.shippingHubAutonomous)
        usedDuck.isOn = Bool(ScoreKeep.shared.usedDuckAutonomous)
        usedTeamScoring.isOn = Bool(ScoreKeep.shared.usedTeamScoringElementAutonomous)
        alliancePartially.isOn = Bool(ScoreKeep.shared.alliancePartiallyAutonomous)
        allianceCompletely.isOn = Bool(ScoreKeep.shared.allianceCompletelyAutonomous)
        warehousePartially.isOn = Bool(ScoreKeep.shared.warehousePartiallyAutonomous)
        warehouseCompletely.isOn = Bool(ScoreKeep.shared.warehouseCompletelyAutonomous)
    }
    
    @IBAction func DuckDelivered(_ sender: UISwitch) {
        ScoreKeep.shared.duckDeliveredAutonomous = Bool(sender.isOn)
    }
    
    @IBAction func parkedAllianceChanged(_ sender: UISwitch) {
        if (sender != alliancePartially && sender.isOn) {
            alliancePartially.isOn = false
        }
        if (sender != allianceCompletely && sender.isOn) {
            allianceCompletely.isOn = false
        }
        if (sender != allianceCompletely && sender.isOn) {
            ScoreKeep.shared.alliancePartiallyAutonomous = Bool(sender.isOn) && true && ScoreKeep.shared.allianceCompletelyAutonomous == false}
        
        else {
            ScoreKeep.shared.allianceCompletelyAutonomous = Bool(sender.isOn) && true && ScoreKeep.shared.alliancePartiallyAutonomous == false}
        
        if (sender != alliancePartially && sender.isOn) {
            ScoreKeep.shared.allianceCompletelyAutonomous = Bool(sender.isOn) && true && ScoreKeep.shared.alliancePartiallyAutonomous == false}
        else {
            ScoreKeep.shared.alliancePartiallyAutonomous = Bool(sender.isOn) && true && ScoreKeep.shared.allianceCompletelyAutonomous == false
        }
    }
    
    @IBAction func parkedWarehouseChanged(_ sender: UISwitch) {
        if (sender != warehousePartially && sender.isOn) {
           warehousePartially.isOn = false
        }
        if (sender != warehouseCompletely && sender.isOn) {
            warehouseCompletely.isOn = false
        }
        if (sender != warehouseCompletely && sender.isOn) {
            ScoreKeep.shared.warehousePartiallyAutonomous = Bool(sender.isOn) && true && ScoreKeep.shared.warehouseCompletelyAutonomous == false}
        
        else {
            ScoreKeep.shared.warehouseCompletelyAutonomous = Bool(sender.isOn) && true && ScoreKeep.shared.warehousePartiallyAutonomous == false}
        
        if (sender != warehousePartially && sender.isOn) {
            ScoreKeep.shared.warehouseCompletelyAutonomous = Bool(sender.isOn) && true && ScoreKeep.shared.warehousePartiallyAutonomous == false}
        else {
            ScoreKeep.shared.warehousePartiallyAutonomous = Bool(sender.isOn) && true && ScoreKeep.shared.warehouseCompletelyAutonomous == false
        }
    }
    
    @IBAction func AllianceStorageUnit(_ sender: UISwitch) {
        ScoreKeep.shared.storageUnitAutonomous = Bool(sender.isOn)
    }
    
    @IBAction func AllianceShippingHub(_ sender: UISwitch) {
        ScoreKeep.shared.shippingHubAutonomous = Bool(sender.isOn)
    }
    
    @IBAction func UsedDuck(_ sender: UISwitch) {
        ScoreKeep.shared.usedDuckAutonomous = Bool(sender.isOn)
    }
    
    @IBAction func UsedTeamScoringElement(_ sender: UISwitch) {
        ScoreKeep.shared.usedTeamScoringElementAutonomous = Bool(sender.isOn)
    }
    
    @IBAction func calculateAutonomous(_ sender: Any) {
        var autonomousRecord = 0
        
        if (duckDelivered.isOn) {autonomousRecord += 10}
        if (alliancePartially.isOn) {autonomousRecord += 3}
        if (allianceCompletely.isOn) {autonomousRecord += 6}
        if (warehousePartially.isOn) {autonomousRecord += 5}
        if (warehouseCompletely.isOn) {autonomousRecord += 10}
        if (storageUnit.isOn) {autonomousRecord += 2}
        if (shippingHub.isOn) {autonomousRecord += 6}
        if (usedDuck.isOn) {autonomousRecord += 10}
        if (usedTeamScoring.isOn) {autonomousRecord += 20}
        
        ScoreKeep.shared.autonomous = autonomousRecord
    }
    
    func clear() {
        duckDelivered.isOn = false
        alliancePartially.isOn = false
        allianceCompletely.isOn = false
        warehousePartially.isOn = false
        warehouseCompletely.isOn = false
        storageUnit.isOn = false
        shippingHub.isOn = false
        usedDuck.isOn = false
        usedTeamScoring.isOn = false
    }
    
    @IBAction func resetButton(_ sender: UIBarButtonItem) {
        clear()
        ScoreKeep.shared.duckDeliveredAutonomous = false
        ScoreKeep.shared.alliancePartiallyAutonomous = false
        ScoreKeep.shared.allianceCompletelyAutonomous = false
        ScoreKeep.shared.warehousePartiallyAutonomous = false
        ScoreKeep.shared.warehouseCompletelyAutonomous = false
        ScoreKeep.shared.storageUnitAutonomous = false
        ScoreKeep.shared.shippingHubAutonomous = false
        ScoreKeep.shared.usedDuckAutonomous = false
        ScoreKeep.shared.usedTeamScoringElementAutonomous = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
