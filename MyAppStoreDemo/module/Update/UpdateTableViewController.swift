//
//  UpdateTableViewController.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/9/18.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class UpdateTableViewController: UITableViewController {

    var dataSources = DataSources
//    var cellHeights: [IndexPath: CGFloat] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.estimatedRowHeight = 171
        tableView.estimatedRowHeight = UITableView.automaticDimension
        
        
        let aa = NSStringFromClass(UpdateTableViewCell.self)
        print(aa)// MyAppStoreDemo.UpdateTableViewCell

        
      
        
        tableView.register(UINib(nibName: "UpdateTableViewCell", bundle: nil), forCellReuseIdentifier: "update")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DataSources.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "update") as! UpdateTableViewCell
        cell.isFirstCell = (indexPath.row == 0)
        cell.moreBtnClickBlock = { [weak self] tappedCell in
            guard let strongSelf = self else {return}
            strongSelf.dataSources[indexPath.row].showMore = true
            strongSelf.tableView.reloadRows(at: [indexPath], with: .none)
            print(indexPath)
        }
        cell.model = dataSources[indexPath.row]

        return cell
    }
    
//    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
//        cellHeights[indexPath] = cell.frame.size.height
//    }
//
//    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
//        if let height = cellHeights[indexPath] {
//            return height
//        } else {
//            return UITableView.automaticDimension
//        }
//    }
//

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

fileprivate let DataSources: [UpdateModel] = [
    UpdateModel(appName: "Huajiao Live", updateDate: "Today", iconImageStr: "logo_broadcast", updateContent: "[Play] Music radio broadcasting page revision, more immersed in music exploration \n\n[Mine] Rewriting sets the position of the night mode \n\n[Radio] Let's go with DJ and get up!", version: "2.0.0", size: 35.7, showMore: false),
       UpdateModel(appName: "Sina Weibo", updateDate: "Today", iconImageStr: "logo_weibo", updateContent: "-Performance improvements and bug fixed", version: "5.3.3", size: 32.5, showMore: false),
       UpdateModel(appName: "Sougou-input", updateDate: "Yesterday", iconImageStr: "logo_smile", updateContent: "Fix bug and to be better for you", version: "2.1.1", size: 42.2, showMore: false),
       UpdateModel(appName: "Guazi Car", updateDate: "Yesterday", iconImageStr: "logo_car", updateContent: "Sometimes, a polish is all you need. No big chages, just a shine", version: "1.5.0", size: 28.0, showMore: false),
       UpdateModel(appName: "Fly-chat", updateDate: "2019/08/02", iconImageStr: "logo_jump", updateContent: "This update includes bug fixed and user interface improvements", version: "1.5.6", size: 33.0, showMore: false),
]
