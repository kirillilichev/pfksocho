//
//  MainScreenViewController+Backend.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation
import UIKit
extension MainScreenViewController {
    func setupDataOfEvents() {
        getDataMatch {
            self.provider.request(.getEvents) { (result) in
               switch result {
               case .success(let resp):
                   let events = try! resp.map([Event].self)
                   
                if self.update {
                    self.events = []
                    self.eventsEnemies = []
                    self.update = false
                }
                   for i in 0 ..< events.count {
                    if events[i].is_home_event! {
                        if events[i].has_liked! {
                            self.setSelectedUpvotes.add(events[i].id!)
                        }
                        self.events.append(events[i])
                    } else {
                        self.eventsEnemies.append(events[i])

                    }
                }
                self.collectionView.reloadData()
                   UIView.animate(withDuration: 0.2) {
                    self.view.alpha = 1
                }
               case .failure(let error):
                   print(error)
                       
               }
           }
        }

    }
    
    func updateDataOfEvents() {
        self.update = true
        setupDataOfEvents()
    }
    
    func setupDataOfEventsEnemies() {
        let event1 = Event()
        event1.name = "Остановите судейский заговорпротив Спартака"
        event1.photo = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
        event1.likes = 100
//        event1.enemyEvent = true

        let event2 = Event()
        event2.name = "Мы против ФК Сочи"
        event2.photo = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
        event2.likes = 123
//        event2.enemyEvent = true
//        let event3 = Event()
//        event3.name = "ЦСКА пидоры без чести"
//        event3.image = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
//        event3.likes = 4214
//
        
        self.eventsEnemies.append(contentsOf: [event1, event2])
    }
    
    
    func getDataMatch(completion: @escaping () -> () ) {
        provider.request(.getNextMatch) { (result) in
            switch result {
                
            case .success(let resp):
                self.matchCurrent = (try! resp.map([Match].self))[0]
                completion()
                
                
                
            case .failure(let error):
                print(error)
                
            }
        }
    }
}
