
//
//  GameLinkTableView.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/21.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

fileprivate let UITableViewCellID = "UITableViewCellID"
fileprivate let linkDataSource: [String] = [
    "Add a Payment Method",
    "Parents' Guide to the App",
    "About In-App Purchases",
    "About Apps & Games for Your Kids",
    "About Personalisation",
    "New to the App Store",
]




class GameLinkTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        dataSource = self
        self.isScrollEnabled = false
    }

}

extension GameLinkTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        linkDataSource.count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: UITableViewCellID)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: UITableViewCellID)
        }
        cell!.textLabel?.font = UIFont.systemFont(ofSize: 22)
        cell!.textLabel?.text = linkDataSource[indexPath.row]
        cell!.textLabel?.textColor = GlobalConstants.textBlueColor
        
        return cell!
    }
    
    
    
    
}




