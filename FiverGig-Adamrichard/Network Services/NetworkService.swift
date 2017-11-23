//
//  NetworkService.swift
//  FiverGig-Adamrichard
//
//  Created by Christopher Brandon Karani on 23/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import Foundation
import TRON



protocol NetworkService {}
class APIService : NetworkService {}


extension NetworkService where Self: APIService {
    func retrieveData(tron: TRON, path: String, completion: @escaping (Model) -> Void) {
        let request: APIRequest<Model, ErrorService> = tron.request(path)
        let headers = ["X-TOKEN": "V4oC3jubRiGUI8Js7bT8Hg"]
        request.headers = headers
        request.method = .get
        request.parameters = ["filter-app_name": "Employee"]
        
        request.perform(withSuccess: { (model) in
            print(model)
            completion(model)
        }) { (error) in
            
            print(error)
        }
    }
}
