//
//  ViewController.swift
//  FiverGig-Adamrichard
//
//  Created by Christopher Brandon Karani on 22/11/2017.
//  Copyright © 2017 Christopher Brandon Karani. All rights reserved.
//

import UIKit
import TRON

class ViewController: UIViewController {
    
    private var modelDataArray = [ModelS]()
    private var apiService : APIService?
    private let tron = TRON(baseURL: "https://na01ws.apperian.com")
    private let path : String = "/v1/reports/download_activity?filter-app_name=Employee"
    var path2 = "/v1/reports/download_activity"
    
    lazy var tableView : CKTableView = { [unowned self] in
        let tableView = CKTableView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .white
        return tableView
    }()
    
    fileprivate func handleNetworkActivity () {
        apiService = APIService()
        apiService?.retrieveData(tron: tron, path: path2, completion: { model in
            self.modelDataArray = model.items
            if self.modelDataArray.count > 0 {
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        })
    }
    
    fileprivate func tableViewSetup() {
        // add to subview, set constraits
        view.addSubview(tableView)
        tableView.fillSuperview()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        handleNetworkActivity()
        navigationItem.title = "Data"
        
    }
}
extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
}

extension ViewController: UITableViewDataSource {
    
    fileprivate func setupAttributedText(withString text: String, textType: LabelType) -> NSAttributedString {
        let attributes = [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 16)]
        let attributedString = NSMutableAttributedString(string: textType.returnStringValue(), attributes: attributes)
        
        let valueText = NSMutableAttributedString(string: text)
        attributedString.append(valueText)
        return attributedString
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! CKCell
        let model = modelDataArray[indexPath.row]
        cell.firstNameLabel.setup(withValueText: model.firstName)
        cell.lastNameLabel.setup(withValueText: model.lastName)
        cell.emailLabel.setup(withValueText: model.email)
        cell.userIDLabel.setup(withValueText: model.userID)
        cell.osLabel.setup(withValueText: model.oS)
        cell.versionLabel.setup(withValueText: model.version)
        cell.appNameLabel.setup(withValueText: model.appName)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return modelDataArray.count
    }
}

