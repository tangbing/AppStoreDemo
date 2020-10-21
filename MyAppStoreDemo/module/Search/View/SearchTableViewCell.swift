//
//  SearchTableViewCell.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/21.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class SearchTableViewCell: UITableViewCell {

    var canChangeHightlighted: Bool = false {
        didSet {
            if !canChangeHightlighted {
                textLabel?.textColor = .black
            }
        }
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()

    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    private func setupUI(){
        textLabel?.textColor = GlobalConstants.textBlueColor
        textLabel?.font = UIFont.systemFont(ofSize: 19)
        selectionStyle = .none
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        
        if !canChangeHightlighted {return}
        
        if highlighted {
            textLabel?.textColor = .white
            backgroundColor = GlobalConstants.textBlueColor
        } else {
            textLabel?.textColor = GlobalConstants.textBlueColor
            backgroundColor = .white
        }
    }
    
}
