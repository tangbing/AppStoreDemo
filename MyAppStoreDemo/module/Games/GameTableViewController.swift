//
//  GameTableViewController.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/9/18.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class GameTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        adjustNavigationForiOS13()
        setNavigationBarBottomLineHidden(true)
        addIconButtonOnNavigationBar()
      }

    
   
    // MARK: - Table view data source

       override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return GlobalConstants.recommandHeight
        } else if indexPath.section == 1 {
            return GlobalConstants.topicHeight
        } else if indexPath.section == 2 {
            return GlobalConstants.linkHeight
        }
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if section == 0 || section == 1 || section == 2 {
            return 1
        }
        return 0
    }

}
