//
//  GameLinkTableViewCell.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/21.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class GameLinkTableViewCell: UITableViewCell {

    private lazy var header: CommonSectionHeaderView = {
        let iv = CommonSectionHeaderView(frame: CGRect(x: 0, y: 0, width: kScreenW, height: 42))
        iv.changeSectionTitle(with: "Quick Links")
        return iv
    }()
    
    private lazy var tableView: GameLinkTableView = {
        let iv = GameLinkTableView()
        let frame = CGRect(x: 0, y: 42, width: kScreenW, height: GlobalConstants.linkCellHeight * 6)
        iv.frame = frame
        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(header)
        addSubview(tableView)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
