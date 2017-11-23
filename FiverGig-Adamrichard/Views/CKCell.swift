//
//  CKCell.swift
//  FiverGig-Adamrichard
//
//  Created by Christopher Brandon Karani on 23/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//


/*
 first_name
 last_name
 app_name
 version
 user_id
 OS
 email
 
 total count: 7
 */


import UIKit

class CKCell : UITableViewCell {

    func handleModel() {
        
    }
    
    
    var firstNameLabel: ValueLabel = {
       let label = ValueLabel(valuetext: "Chris", labeltype: .firstName)
        return label
    }()
    
    var lastNameLabel: ValueLabel = {
        let label = ValueLabel(valuetext: "Mizell", labeltype: .lastName)
        return label
    }()
    
    var emailLabel: ValueLabel = {
        let label = ValueLabel(valuetext: "cmizell+appdemo@arxan.com", labeltype: .email)
        return label
    }()
    
    var versionLabel : ValueLabel = {
        let label = ValueLabel(valuetext: "1", labeltype: .version)
        return label
    }()
    
    var appNameLabel: ValueLabel = {
       let label = ValueLabel(valuetext: "Employee", labeltype: .appName)
        return label
    }()
    
    var userIDLabel : ValueLabel = {
       let label = ValueLabel(valuetext: "cmizell+appdemo@arxan.com", labeltype: .userID)
        return label
    }()
    
    var osLabel : ValueLabel = {
       let label = ValueLabel(valuetext: "iPhone OS 10.3.3", labeltype: .OS)
        return label
    }()
    
    lazy var stackView: UIStackView = { [unowned self] in
        let viewsToDisplay : [ValueLabel] = self.allLabels
        let stackView = UIStackView(arrangedSubviews: viewsToDisplay)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        return stackView
    }()

    
    var allLabels : [ValueLabel] {
        return [firstNameLabel, lastNameLabel, appNameLabel, versionLabel, userIDLabel, osLabel, emailLabel]
    }
    
    func setupViews() {

        addSubview(stackView)
        stackView.anchor(topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 10, leftConstant: 10, bottomConstant: 10, rightConstant: 0, widthConstant: 0, heightConstant: 0)

    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    private func setup() {
        hideDefualtLabels()
        setupViews()
    }
    
    fileprivate func hideDefualtLabels() {
        detailTextLabel?.isHidden = true
        textLabel?.isHidden = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
