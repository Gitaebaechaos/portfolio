//
//  Team.swift
//  Assignment2 - Freight Frenzy
//
//  Created by 배기태 on 2021/11/04.
//

import UIKit

class Team: NSObject {
    private var storedimage: UIImage = UIImage()
    private var storedlocation: String = ""
    private var storedname: String = ""
    private var storedid: Int32 = 0
    private var storedcreated: Int32 = 0

    var image: UIImage {
        get { return storedimage }
        set { storedimage = newValue }
    }

    var location: String {
        get { return storedlocation }
    }

    var name: String {
        get { return storedname }
    }
    var id: Int32 {
        get { return storedid }
    }
    var created: Int32 {
        get { return storedcreated }
    }

    init(image: UIImage, location: String, name: String, id: Int32, created: Int32) {
        super.init()
        
        storedimage = image
        storedlocation = location
        storedname = name
        storedid = id
        storedcreated = created
    }

    init(location: String, name: String, id: Int32, created: Int32) {
        super.init()
        
        storedlocation = location
        storedname = name
        storedid = id
        storedcreated = created
    }
    
}
