//
//  CKTableView.swift
//  FiverGig-Adamrichard
//
//  Created by Christopher Brandon Karani on 23/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import UIKit

let cellID = "CellID"
class CKTableView: UITableView {
    override init(frame: CGRect, style: UITableViewStyle) {
        super.init(frame: frame, style: .plain)
        
        setup()
        
        register(CKCell.self, forCellReuseIdentifier: cellID)
        
    }
    
    fileprivate func setup() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
