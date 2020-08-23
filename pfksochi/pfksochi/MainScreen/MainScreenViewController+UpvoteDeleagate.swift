//
//  MainScreenViewController+UpvoteDeleagate.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation
import UIKit

extension MainScreenViewController: MainScreenUpvoteDelegate {
    func upvoteCell(index: Int) {
        setSelectedUpvotes.add(events[index].id!)
        (self.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! MainScreenCollectionViewCell).buttonUpvote.leftImageSrc = UIImage(named: "downvote")
        (self.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! MainScreenCollectionViewCell).buttonUpvote.titleColor = COLOR_YELLOW
        incrementButtonUpvote(index: index)

    }
    func downvoteCell(index: Int) {
         setSelectedUpvotes.remove(events[index].id!)
        (self.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! MainScreenCollectionViewCell).buttonUpvote.leftImageSrc = UIImage(named: "Upvote")
        (self.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! MainScreenCollectionViewCell).buttonUpvote.titleColor = COLOR_DARK
        decrementButtonUpvote(index: index)

    }
    
    func incrementButtonUpvote(index: Int) {
        let button = (self.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! MainScreenCollectionViewCell).buttonUpvote
        button?.titleString = String(Int(button!.titleString)! + 1)
        self.events[index].likes = Int(button!.titleString)!
        provider.request(.sendLike(userId: 1, eventId: self.events[index].id!)) { (result) in
            switch result {
            case .success(let resp):
                print(resp.statusCode)
            case .failure(let error):
                print(error)
            }
        }

    }
    
    func decrementButtonUpvote(index: Int) {
        let button = (self.collectionView.cellForItem(at: IndexPath(item: index, section: 0)) as! MainScreenCollectionViewCell).buttonUpvote
        button?.titleString = String(Int(button!.titleString)! - 1)
        
        self.events[index].likes = Int(button!.titleString)!
        provider.request(.deleteLike(userId: 1, eventId: self.events[index].id!)) { (result) in
            switch result {
            case .success(let resp):
                print(resp.statusCode)
            case .failure(let error):
                print(error)
            }
        }

    }
    
    func setupButtonEmotionalSearch() -> UIButton {
        let button = UIButton(type: .custom)
        button.alpha = 0

        let tabBarHeight = (self.tabBarController?.tabBar.bounds.height)!
        button.setTitle("Купить билет", for: .normal)
        button.setTitleColor(COLOR_DARK, for: .normal)
        button.titleLabel!.font = FONT_MAIN_BOLD.withSize(14)
        standartHeightButtonSearchMore = view.bounds.height - tabBarHeight - 16


        self.view.addSubview(button)

        button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true

        let bottomOffset = self.getButtonEmotionalBottomOffset()

        constaintBottomButtonSearchEmo = self.view.bottomAnchor
            .constraint(equalTo: button.bottomAnchor, constant: bottomOffset)

        constaintBottomButtonSearchEmo.isActive = true
        button.backgroundColor = COLOR_YELLOW
        button.addTarget(self, action: #selector(pressedButtonEmotionalSearch), for: .touchUpInside)
        button.anchor(
            top: nil,
            leading: nil,
            bottom: nil,
            trailing: nil,
            padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
            size: CGSize(width: "Купить билет".width(withConstrainedHeight: 18, font: FONT_MAIN_BOLD) + 90, height: 50)
        )
        return button

    }
    func getButtonEmotionalBottomOffset() -> CGFloat {
        let tabBarHeight = (self.tabBarController?.tabBar.bounds.height)!

        if tabBarHeight == 83 {
            return 20
        } else {
            return 20
        }
    }
    
    @objc func pressedButtonEmotionalSearch() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)

                         // Instantiate the desired view controller from the storyboard using the view controllers identifier
                         // Cast is as the custom view controller type you created in order to access it's properties and methods
                 let eventViewContoller = storyboard.instantiateViewController(withIdentifier: "TicketViewController") as! TicketViewController
                 eventViewContoller.hidesBottomBarWhenPushed = true
                 self.navigationController?.pushViewController(eventViewContoller, animated: true)
    }

    func showButtonEmotionalSearch() {

        UIView.animate(withDuration: 0.2, animations: {

            self.view.bringSubviewToFront(self.buttonEmotionalSearch)
            self.buttonEmotionalSearch.alpha = 1
            let tabBarHeight = (self.tabBarController?.tabBar.bounds.height)!

            self.constaintBottomButtonSearchEmo.constant = self.getButtonEmotionalBottomOffset()
            self.view.layoutSubviews()

        })

      
    }

    func hideButtonEmotionalSearch() {


        UIView.animate(withDuration: 0.2, delay: 0.1, animations: {
            self.view.bringSubviewToFront(self.buttonEmotionalSearch)

            // hide
            self.constaintBottomButtonSearchEmo.constant = -100

            self.view.layoutSubviews()
           
        }) { (_) in
            self.buttonEmotionalSearch.alpha = 1
        }

    }
}
