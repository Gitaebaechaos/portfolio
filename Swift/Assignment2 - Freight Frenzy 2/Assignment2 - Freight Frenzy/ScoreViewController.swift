//
//  ScoreViewController.swift
//  Assignment2 - Freight Frenzy
//
//  Created by 배기태 on 2021/11/05.
//

import UIKit

class ScoreViewController: UIViewController {
    // Do any additional setup after loading the view.
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var teamidLabel: UILabel!
    @IBOutlet weak var autonomousLabel: UILabel!
    @IBOutlet weak var drivercontrolledLabel: UILabel!
    @IBOutlet weak var endgameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    private var scoreID = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationController?.setToolbarHidden(false, animated: false)
        
        
        if (scoreID >= 0) {
            idLabel.text = String(DataManager.shared.scores[scoreID].id)
            teamidLabel.text = String(DataManager.shared.scores[scoreID].teamid)
            locationLabel.text = DataManager.shared.scores[scoreID].location
            autonomousLabel.text = String(DataManager.shared
                .scores[scoreID].autonomous)
            drivercontrolledLabel.text = String(DataManager.shared.scores[scoreID].drivercontrolled)
            endgameLabel.text = String(DataManager.shared.scores[scoreID].endgame)
            scoreLabel.text = String(DataManager.shared.scores[scoreID].score)
        }
    }
    
    var score: Int {
        get  {
            return self.scoreID
        }
        set {
            self.scoreID = newValue
        }
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
