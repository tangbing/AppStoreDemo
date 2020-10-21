//
//  GameTableViewController.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/9/18.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

let GameLinkTableViewCellID = "GameLinkTableViewCellID"
let GameTopicTableViewCellID = "GameTopicTableViewCellID"
let GameRecommandTableViewCellID = "GameRecommandTableViewCellID"


class GameTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        adjustNavigationForiOS13()
        setNavigationBarBottomLineHidden(true)
        addIconButtonOnNavigationBar()
        
        tableView.register(GameLinkTableViewCell.self, forCellReuseIdentifier: GameLinkTableViewCellID)
        tableView.register(GameTopicTableViewCell.self, forCellReuseIdentifier: GameTopicTableViewCellID)
        tableView.register(GameRecommandTableViewCell.self, forCellReuseIdentifier: GameRecommandTableViewCellID)


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
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0  {
           let cell = tableView.dequeueReusableCell(withIdentifier: GameRecommandTableViewCellID, for: indexPath) as! GameRecommandTableViewCell
            return cell
        } else if(indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: GameTopicTableViewCellID, for: indexPath) as! GameTopicTableViewCell
            cell.downloadClosure = { model in
                
                print("click" + model.name)
            }
            
            cell.detailClosure = {
                print("detailClosure....")
            }
                return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: GameLinkTableViewCellID, for: indexPath) as! GameLinkTableViewCell
                return cell
        }
    }

}
