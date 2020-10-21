//
//  UpdateTableViewCell.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/21.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

class UpdateTableViewCell: UITableViewCell {

    // MARK: - IBOutlets
       @IBOutlet weak var topLeftLabel: UILabel!
       @IBOutlet weak var updateAllBtn: UIButton!
       @IBOutlet weak var contentLabel: UILabel!
       @IBOutlet weak var showMoreBtn: UIButton!
       @IBOutlet weak var iconImageView: UIImageView!
       @IBOutlet weak var nameLabel: UILabel!
       @IBOutlet weak var dateLabel: UILabel!
       @IBOutlet weak var versionAndSizeLabel: UILabel!
       
       
       // MARK: - Constraint
       @IBOutlet weak var iconImageViewTopMargin: NSLayoutConstraint!
       @IBOutlet weak var contentLabelBottomMargin: NSLayoutConstraint!
    
    var moreBtnClickBlock: ((_ cell: UpdateTableViewCell)->())?
    
    
    var isFirstCell: Bool = false {
        didSet {
            iconImageViewTopMargin.constant = isFirstCell ? 48 : 16
            topLeftLabel.isHidden = !isFirstCell
            updateAllBtn.isHidden = !isFirstCell
        }
    }
    
    var model: UpdateModel! {
        didSet {
            topLeftLabel.text = model.appName
            iconImageView.image = UIImage(named: model.iconImageStr)
            dateLabel.text = model.updateDate
            contentLabel.text = model.updateContent
            versionAndSizeLabel.text = "Version" + model.version + "." + String(model.size) + "MB"
            showMoreBtn.isHidden = model.showMore
            contentLabel.numberOfLines = model.showMore ? 0 : 1
            contentLabelBottomMargin.constant = model.showMore ? 60 : 20
            versionAndSizeLabel.isHidden = !model.showMore
            
            
            print("aaa")
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func moreBtnClick(_ sender: UIButton) {
        
        guard let moreBtnClick = moreBtnClickBlock else {return}
        moreBtnClick(self)

    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
