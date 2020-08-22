//
//  MainScreenViewController+Backend.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation

extension MainScreenViewController {
    func setupDataOfEvents() {
        let event1 = Event()
        event1.name = "Давайте соберем плакат \"Сочи, я люблю тебя\""
        event1.image = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
        event1.likes = 100
        
        let event2 = Event()
        event2.name = "Победим вместе"
        event2.image = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
        event2.likes = 123
        
//        let event3 = Event()
//        event3.name = "ЦСКА пидоры без чести"
//        event3.image = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
//        event3.likes = 4214
//
        
        self.events.append(contentsOf: [event1, event2])
    }
    
    func setupDataOfEventsEnemies() {
        let event1 = Event()
        event1.name = "Остановите судейский заговорпротив Спартака"
        event1.image = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
        event1.likes = 100
        event1.enemyEvent = true

        let event2 = Event()
        event2.name = "Мы против ФК Сочи"
        event2.image = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
        event2.likes = 123
        event2.enemyEvent = true
//        let event3 = Event()
//        event3.name = "ЦСКА пидоры без чести"
//        event3.image = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
//        event3.likes = 4214
//
        
        self.eventsEnemies.append(contentsOf: [event1, event2])
    }
}
