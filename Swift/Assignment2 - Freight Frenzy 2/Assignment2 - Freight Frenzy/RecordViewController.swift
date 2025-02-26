//
//  RecordViewController.swift
//  Assignment2 - Freight Frenzy
//
//  Created by 배기태 on 2021/11/02.
//

import UIKit

class RecordViewController: UIViewController {

    @IBOutlet weak var autonomous: UILabel!
    @IBOutlet weak var driverControlledPeriod: UILabel!
    @IBOutlet weak var endGame: UILabel!
    @IBOutlet weak var total: UILabel!
    @IBOutlet weak var reset: UIBarButtonItem!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        autonomous.text = ScoreKeep.shared.autonomous.description
        driverControlledPeriod.text = ScoreKeep.shared.driverControlledPeriod.description
        endGame.text = ScoreKeep.shared.endGame.description
        total.text = ScoreKeep.shared.record.description
        
    }
    
    func clear() {
        autonomous.text = "0"
        driverControlledPeriod.text = "0"
        endGame.text = "0"
        total.text = "0"
    }
    
    @IBAction func resetButton(_ sender: UIBarButtonItem) {
        clear()
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
