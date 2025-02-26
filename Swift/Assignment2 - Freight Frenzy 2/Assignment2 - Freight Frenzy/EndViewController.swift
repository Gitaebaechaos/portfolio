//
//  EndViewController.swift
//  Assignment2 - Freight Frenzy
//
//  Created by 배기태 on 2021/11/02.
//

import UIKit

class EndViewController: UIViewController {

    @IBOutlet weak var ducksDelivered: UILabel!
    @IBOutlet weak var hubBalanced: UISwitch!
    @IBOutlet weak var hubCapped: UISwitch!
    @IBOutlet weak var hubTipped: UISwitch!
    @IBOutlet weak var partiallyWarehouse: UISwitch!
    @IBOutlet weak var completelyWarehouse: UISwitch!
    @IBOutlet weak var ducksDeliveredCounter: UIStepper!
    @IBOutlet weak var reset: UIBarButtonItem!
    @IBOutlet weak var doScore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ducksDelivered.text = ScoreKeep.shared.ducksDeliveredEndGame.description
        ducksDeliveredCounter.value = Double(ScoreKeep.shared.ducksDeliveredEndGame)
        hubBalanced.isOn = Bool(ScoreKeep.shared.hubBalancedEndGame)
        hubCapped.isOn = Bool(ScoreKeep.shared.hubCappedEndGame)
        hubTipped.isOn = Bool(ScoreKeep.shared.hubTippedEndGame)
        partiallyWarehouse.isOn = Bool(ScoreKeep.shared.partiallyWarehouseEndGame)
        completelyWarehouse.isOn = Bool(ScoreKeep.shared.completelyWarehouseEndGame)
    }
    
    @IBAction func ducksDeliveredChanged(_ sender: UIStepper) {
        ducksDelivered.text = Int(sender.value).description
        ScoreKeep.shared.ducksDeliveredEndGame = Int(sender.value)
    }
    
    @IBAction func hubBalanced(_ sender: UISwitch) {
        
        ScoreKeep.shared.hubBalancedEndGame = Bool(sender.isOn)
    }
    
    @IBAction func hubCapped(_ sender: UISwitch) {
        
        ScoreKeep.shared.hubCappedEndGame = Bool(sender.isOn)
    }
    
    @IBAction func hubTipped(_ sender: UISwitch) {
        ScoreKeep.shared.hubTippedEndGame = Bool(sender.isOn)
    }
    
    @IBAction func parkedChanged(_ sender: UISwitch) {
        if (sender != partiallyWarehouse && sender.isOn) {
            partiallyWarehouse.isOn = false
        }
        if (sender != completelyWarehouse && sender.isOn) {
            completelyWarehouse.isOn = false
        }
        if (sender != completelyWarehouse && sender.isOn) {
            ScoreKeep.shared.partiallyWarehouseEndGame = Bool(sender.isOn) && true && ScoreKeep.shared.completelyWarehouseEndGame == false}
        
        else {
            ScoreKeep.shared.completelyWarehouseEndGame = Bool(sender.isOn) && true && ScoreKeep.shared.partiallyWarehouseEndGame == false}

        if (sender != partiallyWarehouse && sender.isOn) {
            ScoreKeep.shared.completelyWarehouseEndGame = Bool(sender.isOn) && true && ScoreKeep.shared.partiallyWarehouseEndGame == false}
        else {
            ScoreKeep.shared.partiallyWarehouseEndGame = Bool(sender.isOn && true && ScoreKeep.shared.completelyWarehouseEndGame == false)
        }
    }
    
    
    @IBAction func calculateEndGame(_ sender: Any) {
        var endgameRecord = 0
        
        endgameRecord += (Int(ducksDelivered.text!) ?? 0) * 6
        if (hubBalanced.isOn) {endgameRecord += 20}
        if (hubCapped.isOn) {endgameRecord += 3}
        if (hubTipped.isOn) {endgameRecord += 10}
        if (partiallyWarehouse.isOn) {endgameRecord += 6}
        if (completelyWarehouse.isOn) {endgameRecord += 15}
        
        ScoreKeep.shared.endGame = endgameRecord
    }
   
    func clear() {
        ducksDelivered.text = "0"
        hubBalanced.isOn = false
        hubCapped.isOn = false
        hubTipped.isOn = false
        partiallyWarehouse.isOn = false
        completelyWarehouse.isOn = false
    }
    
    @IBAction func resetButton(_ sender: UIBarButtonItem) {
        clear()
        
        ScoreKeep.shared.ducksDeliveredEndGame = 0
        ScoreKeep.shared.hubBalancedEndGame = false
        ScoreKeep.shared.hubCappedEndGame = false
        ScoreKeep.shared.hubTippedEndGame = false
        ScoreKeep.shared.partiallyWarehouseEndGame = false
        ScoreKeep.shared.completelyWarehouseEndGame = false
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
