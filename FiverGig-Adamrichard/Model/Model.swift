//
//  Model.swift
//  FiverGig-Adamrichard
//
//  Created by Christopher Brandon Karani on 23/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//


import Foundation
import TRON
import SwiftyJSON

/*
 first_name
 last_name
 app_name
 version
 user_id
 OS
 email
 
 */

struct Model: JSONDecodable {
    
    let items : [ModelS]
    
    init(json: JSON) throws {
        var items = [ModelS]()
        
        let data = json["report"]["entries"].arrayValue
        for model in data {
            let firstName = model["first_name"].stringValue
            let lastName = model["last_name"].stringValue
            let email = model["email"].stringValue
            let appName = model["app_name"].stringValue
            let version = model["version"].stringValue
            let userID = model["user_id"].stringValue
            let oS = model["OS"].stringValue
            let modelS = ModelS(firstName: firstName, lastName: lastName, email: email, appName: appName, version: version, userID: userID, oS: oS)
            items.append(modelS)
        }
        self.items = items
    }
}

struct ModelS {
    var firstName: String
    var lastName: String
    var email: String
    var appName: String
    var version: String
    var userID: String
    var oS: String
}

