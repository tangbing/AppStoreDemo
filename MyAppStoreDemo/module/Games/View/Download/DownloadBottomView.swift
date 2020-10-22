
//
//  DownloadBottomView.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/22.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

protocol DownloadBottomViewDelegate: class {
    func downloadBottomViewDidClickCancel(_ bottom: DownloadBottomView)
}

class DownloadBottomView: UIView {
    
    weak var delegate : DownloadBottomViewDelegate?
    
    @IBAction func cancelAction(_ sender: UIButton) {
        delegate?.downloadBottomViewDidClickCancel(self)
    }
    
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    
    public static func setupDownloadBttomView() -> DownloadBottomView {
        let iv = Bundle.main.loadNibNamed("DownloadBottomView", owner: nil, options: nil)?.first as! DownloadBottomView
        return iv
    }
    
    var model: GameTopicModel! {
          didSet {
              nameLabel.text = model.name
              descLabel.text = model.desc
              iconImageView.image = UIImage(named: model.iconImageName)
          }
      }

}
