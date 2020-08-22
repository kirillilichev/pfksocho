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
extension MainScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func setupCollectionView() {
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        self.collectionView.register(MainScreenCollectionViewCell.self, forCellWithReuseIdentifier: "MainScreenCollectionViewCell")
        collectionView.register(MainScreenCollectionViewHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainScreenCollectionViewHeader")
        collectionView.register(MainScreenCollectionViewFooter.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainScreenCollectionViewFooter")
        self.collectionView.register(MainScreenCollectionViewEnemyCell.self, forCellWithReuseIdentifier: "MainScreenCollectionViewEnemyCell")


        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.itemSize = CGSize(width: self.view.bounds.width, height: 64)
        collectionViewLayout.minimumLineSpacing = 2
        collectionView.collectionViewLayout = collectionViewLayout
        collectionView.contentInset = UIEdgeInsets(top: 0, left: 16, bottom: 90, right: 16)
        collectionViewLayout.headerReferenceSize = CGSize(width: self.view.bounds.width, height: 260)
        collectionViewLayout.footerReferenceSize = CGSize(width: self.view.bounds.width, height: 20)
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            return self.events.count + 1
        } else {
            return self.eventsEnemies.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainScreenCollectionViewCell", for: indexPath) as! MainScreenCollectionViewCell
            
            if indexPath.row != self.events.count {
                cell.delegate = self
                cell.indexOfCell = indexPath.row
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
            
            if setSelectedUpvotes.contains(indexPath.row) {
                    cell.buttonUpvote.leftImageSrc = UIImage(named: "downvote")
                    cell.buttonUpvote.titleColor = COLOR_YELLOW

                
            } else {

                cell.buttonUpvote.leftImageSrc = UIImage(named: "Upvote")
                cell.buttonUpvote.titleColor = COLOR_DARK
            }
            cell.layoutSubviews()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainScreenCollectionViewEnemyCell", for: indexPath) as! MainScreenCollectionViewEnemyCell
            cell.imageViewPoster.kf.setImage(with: URL(string: self.eventsEnemies[indexPath.row].image!))
            cell.label.text = eventsEnemies[indexPath.row].name
         
        
            cell.layoutSubviews()
            return cell
        }

        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        if indexPath.row
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section != 0 {
            return CGSize(width: 0, height: 0)
        } else {
            return CGSize(width: self.view.bounds.width, height: 20)
        }
   
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section != 0 {
             return CGSize(width: 0, height: 0)
         } else {
             return CGSize(width: self.view.bounds.width, height: 260)
         }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if indexPath.section == 0 {
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

            } else if kind == UICollectionView.elementKindSectionFooter {
                let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainScreenCollectionViewFooter", for: indexPath) as! MainScreenCollectionViewFooter
                footer.label.text = "Соперники планируют"
                return footer
                
            }
            
        }

        let cell = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "MainScreenCollectionViewHeader", for: indexPath)
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if buttonEmotionalSearch != nil {
            if scrollView.contentOffset.y > 100 {
                self.showButtonEmotionalSearch()
            } else {
                self.hideButtonEmotionalSearch()
            }
        }
    }

}
