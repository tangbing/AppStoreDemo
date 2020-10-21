//
//  GameRecommandTableViewCell.swift
//  MyAppStoreDemo
//
//  Created by Tb on 2020/10/21.
//  Copyright © 2020 Tb. All rights reserved.
//

import UIKit

let RecommandCollectionViewCellID = "RecommandCollectionViewCellID"

class GameRecommandTableViewCell: UITableViewCell {

    private lazy var recommandCollectionView: UICollectionView = {
        
        let frame = CGRect(x: 0, y: 0, width: kScreenW, height: GlobalConstants.recommandHeight)

        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: kScreenW - 2 * GlobalConstants.leftMargin, height: GlobalConstants.recommandHeight)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        let iv = UICollectionView(frame: frame, collectionViewLayout: layout)
        iv.register(UINib(nibName: "RecommandCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: RecommandCollectionViewCellID)
        iv.backgroundColor = .white
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
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupUI() {
        backgroundColor = .white

        contentView.addSubview(recommandCollectionView)
    }

}

extension GameRecommandTableViewCell: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return RecommandDataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommandCollectionViewCellID, for: indexPath) as! RecommandCollectionViewCell
        
        cell.model = RecommandDataSource[indexPath.row]
        return cell
        
    }
}

extension  GameRecommandTableViewCell: UICollectionViewDelegate {
    
}

fileprivate let RecommandDataSource: [GameRecommandModel] = [
    GameRecommandModel(feature: "MAJOR UPDATE", name: "Onmyoji", desc: "Cards", coverImageName: "cover_1"),
    GameRecommandModel(feature: "NEW GAME", name: "Clash Royale", desc: "Strategy", coverImageName: "cover_2"),
    GameRecommandModel(feature: "REDISCOVER THIS", name: "Fantasy Westward Journey", desc: "Adventure", coverImageName: "cover_3")
]
