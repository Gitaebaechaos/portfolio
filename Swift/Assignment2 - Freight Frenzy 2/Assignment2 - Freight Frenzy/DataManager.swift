//
//  DataManager.swift
//  Assignment2 - Freight Frenzy
//
//  Created by 배기태 on 2021/11/04.
//

import UIKit
import CoreData

class DataManager: NSObject {
    static let shared = DataManager()
        
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    //Store Data in DataManager
    
    private var storedTeams = [Team]()
    
    var teams: [Team] {
        get { return storedTeams }
    }
    
    override init() {
        super.init()
        
        loadTeamsFromCoreData()
        refreshTeams()
        loadScoresFromCoreData()
        refreshScores()
    }
    
    func loadTeamsFromCoreData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Teams")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            
            let loadedTeams = results as! [NSManagedObject]
            
            for team in loadedTeams {
                let binaryData = team.value(forKey: "image") as! Data
                let image = UIImage(data: binaryData)
                let location = team.value(forKey: "location") as! String
                let name = team.value(forKey: "name") as! String
                let created = team.value(forKey: "created") as! Int32
                let id = team.value(forKey: "id") as! Int32
                
                let loadedTeam = Team(image: image!, location: location, name: name, id : id, created: created);
                
                storedTeams.append(loadedTeam)
            }
        }
        catch let error as NSError {
            print("Could not load. \(error), \(error.userInfo)")
        }
    }
    
    func refreshTeams() {
        let url = NSURL(string: "https://www.partiklezoo.com/freightfrenzy/?action=teams")
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url! as URL, completionHandler:
        {(data, response, error) in
            if (error != nil) { return; }
            if let json = try? JSON(data: data!) {
                if json.count > 0 {
                    for count in 0...json.count - 1 {
                        let jsonTeam = json[count]
                        let newTeam = Team(location: jsonTeam["location"].string!, name: jsonTeam["name"].string!, id: Int32(jsonTeam["id"].string!) ?? 0, created: Int32(jsonTeam["created"].string!) ?? 0)
                        let imageURLString = "https://www.partiklezoo.com/freightfrenzy/images/" + jsonTeam["image"].string!
                        self.addItemToTeams(newTeam, imageURL: imageURLString)
                    }
                }
            }
        })
        
        task.resume()
    }
    
    func addItemToTeams(_ newTeam: Team!, imageURL: String) {
        if !checkForTeam(newTeam) {
            
            newTeam.image = loadImage(imageURL)
            
            let entity = NSEntityDescription.entity(forEntityName: "Teams", in: managedContext)
            let teamToAdd = NSManagedObject(entity: entity!, insertInto: managedContext)
            
            teamToAdd.setValue(newTeam.image.pngData(), forKey: "image")
            teamToAdd.setValue(newTeam.location, forKey: "location")
            teamToAdd.setValue(newTeam.name, forKey: "name")
            teamToAdd.setValue(newTeam.created, forKey: "created")
            
            do {
                try managedContext.save()
            }
            catch let error as NSError
            {
                print("Could not save. \(error), \(error.userInfo)")
            }
            
            storedTeams.append(newTeam)

        }
    }
    
    func loadImage(_ imageURL: String) -> UIImage
    {
        var image: UIImage!
        if let url = NSURL(string: imageURL)
        {
            if let data = NSData(contentsOf: url as URL)
            {
                image = UIImage(data: data as Data)
            }
        }
        return image!
    }
   
    func checkForTeam(_ searchItem: Team) -> Bool {
        var found = false
        
        if (teams.count > 0) {
            for team in teams {
                if (team.id==searchItem.id) {
                    found = true
                }
            }
        }
        
        return found
    }
    
    private var storedScores = [Score]()
    
    var scores: [Score] {
        get { return storedScores }
    }
    func loadScoresFromCoreData() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Scores")
        
        do {
            let results = try managedContext.fetch(fetchRequest)
            
            let loadedScores = results as! [NSManagedObject]
            
            for score in loadedScores {
                let id = score.value(forKey: "id") as! Int32
                let teamid = score.value(forKey: "teamid") as! Int32
                let location = score.value(forKey: "location") as! String
                let autonomous = score.value(forKey: "autonomous") as! Int32
                let drivercontrolled = score.value(forKey: "drivercontrolled") as! Int32
                let endgame = score.value(forKey: "endgame") as! Int32
                let score = score.value(forKey: "score") as! Int32
                let loadedScore = Score(id: id, teamid: teamid, autonomous: autonomous, drivercontrolled: drivercontrolled, endgame: endgame, score: score, location: location);
                
                storedScores.append(loadedScore)
            }
        }
        catch let error as NSError {
            print("Could not load. \(error), \(error.userInfo)")
        }
    }
    
    func refreshScores() {
        let url = NSURL(string: "https://www.partiklezoo.com/freightfrenzy/?")
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url! as URL, completionHandler:
        {(data, response, error) in
            if (error != nil) { return; }
            if let json = try? JSON(data: data!) {
                if json.count > 0 {
                    for count in 0...json.count - 1 {
                        let jsonScore = json[count]
                        let newScore = Score(id: Int32(jsonScore["id"].string!) ?? 0, teamid: Int32(jsonScore["teamid"].string!) ?? 0, autonomous: Int32(jsonScore["autonomous"].string!) ?? 0, drivercontrolled: Int32(jsonScore["drivercontrolled"].string!) ?? 0, endgame: Int32(jsonScore["endgame"].string!) ?? 0, score: Int32(jsonScore["score"].string!) ?? 0, location: jsonScore["location"].string!)
                    }
                }
            }
        })
        
        task.resume()
    }
   
    func checkForScore(_ searchItem: Score) -> Bool {
        var found = false
        
        if (scores.count > 0) {
            for score in scores {
                if (score.id==searchItem.id) {
                    found = true
                }
            }
        }
        
        return found
    }
        
    }
