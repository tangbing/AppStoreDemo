//
//  TodayTableViewController.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/9/18.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class TodayTableViewController: UITableViewController {

    var selectCell: TodayTableViewCell?
    var statusBarShouldBeHidden = false
    
    override var prefersStatusBarHidden: Bool {
        return statusBarShouldBeHidden
    }
    
    
    lazy var headerView: TodayTableHeaderView  = {
       let view = TodayTableHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 96))
        view.iconButtonClosure = {[weak self] in
            guard let strongSelf = self else {return}
            
            strongSelf.presentUserTableViewController()
        }
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
    }
    
    func setupTableView() {
        tableView.register(TodayTableViewCell.self, forCellReuseIdentifier: "today")
        tableView.separatorStyle = .none
        tableView.rowHeight = GlobalConstants.toDayCardRowH
        tableView.tableHeaderView = headerView
    }
    
    private func updateStatusBarAndTabbarFrame(visible: Bool) {
        statusBarShouldBeHidden = !visible
        UIView.animate(withDuration: 0.25) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    @objc override func presentUserTableViewController() {
        let nav = UserTableViewController.setupUserTalbeView()
        self.present(nav, animated: true, completion: nil)
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "today", for: indexPath) as! TodayTableViewCell
        cell.selectionStyle = .none
        if indexPath.row == 0 {
            cell.bgImageView.image = #imageLiteral(resourceName: "cover_4")
        } else {
            cell.bgImageView.image = #imageLiteral(resourceName: "cover_5")
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        guard let row = tableView.cellForRow(at: indexPath) as? TodayTableViewCell else {
            return
        }
        UIView.animate(withDuration: 0.1) {
            row.bgBackView.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
    }
    
    override func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        guard let row = tableView.cellForRow(at: indexPath) as? TodayTableViewCell else {
            return
        }
        UIView.animate(withDuration: 0.1) {
            row.bgBackView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? TodayTableViewCell else {
            return
        }
        
        self.selectCell = cell
        
        let detailVc = CardDetailViewController(cell: cell)
        
        updateStatusBarAndTabbarFrame(visible: false)
        present(detailVc, animated: true, completion: nil)
        
    }

}
