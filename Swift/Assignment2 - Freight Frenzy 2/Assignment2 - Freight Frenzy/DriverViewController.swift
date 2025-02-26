//
//  DriverViewController.swift
//  Assignment2 - Freight Frenzy
//
//  Created by 배기태 on 2021/11/02.
//

import UIKit

class DriverViewController: UIViewController {

    @IBOutlet weak var storageUnit: UILabel!
    @IBOutlet weak var hubLevel1: UILabel!
    @IBOutlet weak var hubLevel2: UILabel!
    @IBOutlet weak var hubLevel3: UILabel!
    @IBOutlet weak var allianceHub: UILabel!
    @IBOutlet weak var reset: UIBarButtonItem!
    @IBOutlet weak var doScore: UIButton!
    @IBOutlet weak var storageUnitCounter: UIStepper!
    @IBOutlet weak var hubLevel1Counter: UIStepper!
    @IBOutlet weak var hubLevel2Counter: UIStepper!
    @IBOutlet weak var hubLevel3Counter: UIStepper!
    @IBOutlet weak var allianceHubCounter: UIStepper!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        storageUnit.text = ScoreKeep.shared.storageUnitDriverControlledPeriod.description
        storageUnitCounter.value = Double(ScoreKeep.shared.storageUnitDriverControlledPeriod)
        hubLevel1.text = ScoreKeep.shared.hubLevel1DriverControlledPeriod.description
        hubLevel1Counter.value = Double(ScoreKeep.shared.hubLevel1DriverControlledPeriod)
        hubLevel2.text = ScoreKeep.shared.hubLevel2DriverControlledPeriod.description
        hubLevel2Counter.value = Double(ScoreKeep.shared.hubLevel2DriverControlledPeriod)
        hubLevel3.text = ScoreKeep.shared.hubLevel3DriverControlledPeriod.description
        hubLevel3Counter.value = Double(ScoreKeep.shared.hubLevel3DriverControlledPeriod)
        allianceHub.text = ScoreKeep.shared.allianceHubDriverControlledPeriod.description
        allianceHubCounter.value = Double(ScoreKeep.shared.allianceHubDriverControlledPeriod)
    }
    
    @IBAction func storageUnitChanged(_ sender: UIStepper) {
        storageUnit.text = Int(sender.value).description
        ScoreKeep.shared.storageUnitDriverControlledPeriod = Int(sender.value)
    }
    
    @IBAction func hubLevel1Changed(_ sender: UIStepper) {
        hubLevel1.text = Int(sender.value).description
        ScoreKeep.shared.hubLevel1DriverControlledPeriod = Int(sender.value)
    }
    
    @IBAction func hubLevel2Changed(_ sender: UIStepper) {
        hubLevel2.text = Int(sender.value).description
        ScoreKeep.shared.hubLevel2DriverControlledPeriod = Int(sender.value)
    }
    
    @IBAction func hubLevel3Changed(_ sender: UIStepper) {
        hubLevel3.text = Int(sender.value).description
        ScoreKeep.shared.hubLevel3DriverControlledPeriod = Int(sender.value)
    }
    
    @IBAction func allianceHubChanged(_ sender: UIStepper) {
        allianceHub.text = Int(sender.value).description
        ScoreKeep.shared.allianceHubDriverControlledPeriod = Int(sender.value)
    }
    
    @IBAction func calculateDriverControlledPeriod(_ sender: Any) {
        
        var drivercontrolledperiodRecord = 0
        drivercontrolledperiodRecord += (Int(storageUnit.text!) ?? 0)*1
        drivercontrolledperiodRecord += (Int(hubLevel1.text!) ?? 0)*2
        drivercontrolledperiodRecord += (Int(hubLevel2.text!) ?? 0)*4
        drivercontrolledperiodRecord += (Int(hubLevel3.text!) ?? 0)*6
        drivercontrolledperiodRecord += (Int(allianceHub.text!) ?? 0)*4
        
        ScoreKeep.shared.driverControlledPeriod = drivercontrolledperiodRecord
    }
    
    func clear() {
        storageUnit.text = "0"
        hubLevel1.text = "0"
        hubLevel2.text = "0"
        hubLevel3.text = "0"
        allianceHub.text = "0"
    }
    
    @IBAction func resetButton(_ sender: UIBarButtonItem) {
        clear()
        ScoreKeep.shared.storageUnitDriverControlledPeriod = 0
        ScoreKeep.shared.hubLevel1DriverControlledPeriod = 0
        ScoreKeep.shared.hubLevel2DriverControlledPeriod = 0
        ScoreKeep.shared.hubLevel3DriverControlledPeriod = 0
        ScoreKeep.shared.allianceHubDriverControlledPeriod = 0
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
