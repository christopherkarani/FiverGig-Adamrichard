//
//  ErrorService.swift
//  FiverGig-Adamrichard
//
//  Created by Christopher Brandon Karani on 23/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import SwiftyJSON
import TRON

class ErrorService : JSONDecodable {
    required init(json: JSON) throws {
        print("failed to retrieve data")
    }
}
