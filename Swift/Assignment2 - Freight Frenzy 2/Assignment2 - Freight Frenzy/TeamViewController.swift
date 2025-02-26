//
//  TeamViewController.swift
//  Assignment2 - Freight Frenzy
//
//  Created by 배기태 on 2021/11/04.
//

import UIKit

class TeamViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var created: UILabel!
    @IBOutlet weak var ID: UILabel!
    
    private var teamID = -1
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        navigationController?.setToolbarHidden(false, animated: false)
        
        
        if (teamID >= 0) {
            imageView.image = DataManager.shared.teams[teamID].image
            teamName.text = DataManager.shared.teams[teamID].name
            ID.text = String(DataManager.shared.teams[teamID].id)
            created.text = String( DataManager.shared.teams[teamID].created)
            location.text = DataManager.shared.teams[teamID].location
        }
    }
    
    var team: Int {
        get  {
            return self.teamID
        }
        set {
            self.teamID = newValue
        }
    }
}
