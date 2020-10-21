//
//  GameTopicCollectionViewCell.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/21.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

protocol GameTopicCollectionCellDelegage: class {
    func gameTopicCollectionCellDidClick(cell tipiccell: GameTopicCollectionViewCell)
}

class GameTopicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var lineView: UIView!
    
    weak var delegage: GameTopicCollectionCellDelegage?
    
    var model:GameTopicModel! {
        didSet {
            iconImageView.image = UIImage(named: model.iconImageName)
            nameLabel.text = model.name
            descLabel.text = model.desc
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBAction func getAction(_ sender: UIButton) {
        delegage?.gameTopicCollectionCellDidClick(cell: self)
    }

}
