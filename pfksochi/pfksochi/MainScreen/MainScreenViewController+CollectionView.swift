//
//  MainScreenViewController+CollectionView.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation
import UIKit
import Kingfisher
extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(MainScreenCollectionViewCell.self, forCellWithReuseIdentifier: "MainScreenCollectionViewCell")
        collectionView.register(MainScreenCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainScreenCollectionViewHeader")

        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: self.view.bounds.width, height: 64)
        collectionViewLayout.minimumLineSpacing = 2
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionViewLayout.headerReferenceSize = CGSize(width: self.view.bounds.width, height: 260)

    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.events.count + 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainScreenCollectionViewCell", for: indexPath) as! MainScreenCollectionViewCell
        if indexPath.row != self.events.count {
            cell.imageViewPoster.kf.setImage(with: URL(string: self.events[indexPath.row].image!))
            cell.label.text = events[indexPath.row].name
            cell.buttonUpvote.titleString = String(events[indexPath.row].likes!)
            cell.buttonUpvote.isHidden = false
            cell.labelSecondary.text = "Подробнее"
        } else {
            cell.imageViewPoster.image = UIImage(named: "Plus-view")
            cell.label.text = "Предложить свою"
            cell.labelSecondary.text = ""
            cell.buttonUpvote.isHidden = true

        }
        cell.layoutSubviews()
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

        if kind == UICollectionView.elementKindSectionHeader {

            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainScreenCollectionViewHeader", for: indexPath) as! MainScreenCollectionViewHeader
            let match = Match()
            header.labelTitle.text = "Следующий матч"
            header.labelShortInfo.text = match.place! + "\n" + match.date! + "\n" + match.time!
            header.imageViewHome.image = UIImage(named: "sochi")
            header.imageViewGuest.image = UIImage(named: "spartak")
            header.labelHome.text = match.teamHome!
            header.labelGuest.text = match.teamGuest!
            header.labelCityHome.text = match.cityHome!
            header.labelCityGuest.text = match.cityGuest!
            header.labelBottom.text = "Планируемые акции"
            return header

        }
        
        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainScreenCollectionViewHeader", for: indexPath)
        return cell
    }

}
