//
//  TodayTableHeaderView.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/9/18.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class TodayTableHeaderView: UIView {

    let dateLabel = UILabel()
    let todayLabel = UILabel()
    let iconButton = UIButton()
    var iconButtonClosure: (()->())?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI(){
        dateLabel.text = ""
        dateLabel.textColor = .gray
        dateLabel.font = UIFont.boldSystemFont(ofSize: 13)
        dateLabel.frame = CGRect(x: 20, y: 33, width: 200, height: 15)
        
            todayLabel.text = "Today"
            todayLabel.font = UIFont.boldSystemFont(ofSize: 34)
            todayLabel.frame = CGRect(x: 20, y: 48, width: 200, height: 40)
        
        iconButton.setImage(#imageLiteral(resourceName: "demo_icon"), for: .normal)
               iconButton.setImage(#imageLiteral(resourceName: "demo_icon"), for: .highlighted)
               iconButton.frame = CGRect(x: kScreenW - 20 - 40, y: 46, width: 35, height: 35)
               iconButton.layer.cornerRadius = GlobalConstants.iconCornerRadius
               iconButton.layer.borderColor = GlobalConstants.iconBorderColor
               iconButton.layer.borderWidth = GlobalConstants.iconBorderWidth
               iconButton.addTarget(self, action: #selector(iconButtonAction), for: .touchUpInside)
               
               addSubview(dateLabel)
               addSubview(todayLabel)
               addSubview(iconButton)

    }
    
  @objc private  func iconButtonAction(){
        iconButtonClosure?()
    }

}
