//
//  GameTopicTableViewCell.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/21.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

let GameTopicCollectionViewCellID = "GameTopicCollectionViewCellID"

class GameTopicTableViewCell: UITableViewCell {

    private lazy var headerView: CommonSectionHeaderView = {
           let frame = CGRect(x: 0, y: 0, width: kScreenW, height: 42)
           let it = CommonSectionHeaderView(frame: frame)
           it.changeSectionTitle(with: "What We're Playing")
           return it
       }()
    
    private lazy var topicCollectionView: UICollectionView = {
        
        let frame = CGRect(x: 0, y: 42, width: kScreenW, height: 80 * 3)

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenW - 2 * GlobalConstants.leftMargin, height: 80)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        
        let iv = UICollectionView(frame: frame, collectionViewLayout: layout)
        iv.backgroundColor = .white
       
        iv.register(UINib(nibName: "GameTopicCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: GameTopicCollectionViewCellID)
        iv.showsHorizontalScrollIndicator = false
        iv.showsVerticalScrollIndicator = false

        iv.dataSource = self
        iv.delegate = self

        return iv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI(){
        backgroundColor = .white

        addSubview(headerView)
        addSubview(topicCollectionView)
    }
    
}

extension GameTopicTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TopicDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GameTopicCollectionViewCellID, for: indexPath) as! GameTopicCollectionViewCell
        cell.model = TopicDataSource[indexPath.row]
        return cell
        
    }
}

extension  GameTopicTableViewCell: UICollectionViewDelegate {
    
}

fileprivate let TopicDataSource: [GameTopicModel] = [
    GameTopicModel(name: "Bullet Hell", desc: "Casual", iconImageName: "logo_broadcast"),
    GameTopicModel(name: "Hot Wheels", desc: "Strategy", iconImageName: "logo_car"),
    GameTopicModel(name: "SpellForce - Heroes", desc: "Card", iconImageName: "logo_jump"),
    GameTopicModel(name: "Farm Punks", desc: "Role-Playing", iconImageName: "logo_smile"),
    GameTopicModel(name: "Super Spinball", desc: "A musical journey awaits", iconImageName: "logo_weibo"),
]
