//
//  ValueLabel.swift
//  FiverGig-Adamrichard
//
//  Created by Christopher Brandon Karani on 23/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import UIKit

public enum LabelType {
    case firstName, lastName, appName, version, userID, OS, email
    
    func returnStringValue() -> String {
        switch self {
        case .firstName: return "First Name: "
        case .lastName : return "Last Name: "
        case .appName  : return "App Name: "
        case .version  : return "Version: "
        case .userID   : return "UserID: "
        case .OS       : return "OS: "
        case .email    : return "Email: "
        }
    }
}



class ValueLabel: UILabel {

    
    var labelText: LabelType
    var valueText: String
    
    func setValueText(withText text: String) {
        
    }
    
    init(valuetext: String, labeltype: LabelType) {
        labelText = labeltype
        valueText = valuetext
        
        super.init(frame: .zero)
        
        setup(withValueText: valueText)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func setupAttributedText(withString text: String, textType: LabelType) -> NSAttributedString {
        let attributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)]
        let attributedString = NSMutableAttributedString(string: labelText.returnStringValue(), attributes: attributes)
        
        let valueText = NSMutableAttributedString(string: text)
        attributedString.append(valueText)
        return attributedString
    }
    
    func setup(withValueText text: String) {
        let attributedTextValue = setupAttributedText(withString: text, textType: labelText)
        self.attributedText = attributedTextValue
    }
}
