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
        if self.events.count == 0 { return 0}
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
                if let photo = self.events[indexPath.row].photo {
                    cell.imageViewPoster.kf.setImage(with: URL(string: photo))

                }
                cell.label.text = events[indexPath.row].name
                cell.buttonUpvote.titleString = String(events[indexPath.row].likes!)
                cell.buttonUpvote.isHidden = false
                cell.labelSecondary.text = "Подробнее"
                if setSelectedUpvotes.contains(events[indexPath.row].id!) {
                        cell.buttonUpvote.leftImageSrc = UIImage(named: "downvote")
                        cell.buttonUpvote.titleColor = COLOR_YELLOW
                    cell.buttonUpvote.isSelected = true
                    
                } else {

                    cell.buttonUpvote.leftImageSrc = UIImage(named: "Upvote")
                    cell.buttonUpvote.titleColor = COLOR_DARK
                    cell.buttonUpvote.isSelected = false
                }
            } else {
                cell.imageViewPoster.image = UIImage(named: "Plus-view")
                cell.label.text = "Предложить свою"
                cell.labelSecondary.text = ""
                cell.buttonUpvote.isHidden = true
                
            }
            

            cell.layoutSubviews()
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainScreenCollectionViewEnemyCell", for: indexPath) as! MainScreenCollectionViewEnemyCell
            if let photo = self.eventsEnemies[indexPath.row].photo {
                cell.imageViewPoster.kf.setImage(with: URL(string: photo))

            }
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
                if matchCurrent != nil {
                    let (date, time) = DateConverter.convertStringEmoviDateToString(stringDate: self.matchCurrent.date_time!)
                    header.labelShortInfo.text = self.matchCurrent.stadium! + "\n" + date + "\n" + time
                    header.imageViewHome.kf.setImage(with: URL(string: self.matchCurrent.home_club!.logo_url!))
                    header.imageViewGuest.kf.setImage(with: URL(string: self.matchCurrent.guest_club!.logo_url!))
                    header.labelHome.text = self.matchCurrent.home_club!.name
                    header.labelGuest.text = self.matchCurrent.guest_club!.name
                    header.labelCityHome.text = self.matchCurrent.home_club!.city
                    header.labelCityGuest.text = self.matchCurrent.guest_club!.city
                    header.labelBottom.text = "Планируемые акции"
                }
                header.labelTitle.text = "Следующий матч"
                
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            if indexPath.row == self.events.count {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)

                        // Instantiate the desired view controller from the storyboard using the view controllers identifier
                        // Cast is as the custom view controller type you created in order to access it's properties and methods
                let eventViewContoller = storyboard.instantiateViewController(withIdentifier: "SubmitViewController") as! SubmitViewController
                eventViewContoller.hidesBottomBarWhenPushed = true
                self.navigationController?.pushViewController(eventViewContoller, animated: true)
            } else {

                let storyboard = UIStoryboard(name: "Main", bundle: nil)

                        // Instantiate the desired view controller from the storyboard using the view controllers identifier
                        // Cast is as the custom view controller type you created in order to access it's properties and methods
                let eventViewContoller = storyboard.instantiateViewController(withIdentifier: "EventViewController") as! EventViewController
                eventViewContoller.eventCurrent = events[indexPath.row]
                eventViewContoller.hidesBottomBarWhenPushed = true
                if self.setSelectedUpvotes.contains(events[indexPath.row].id!) {
                    eventViewContoller.pressed = true
                }
                self.navigationController?.pushViewController(eventViewContoller, animated: true)
            }
        }
    }

}
