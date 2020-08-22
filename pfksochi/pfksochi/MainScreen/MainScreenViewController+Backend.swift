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
        event1.name = "Ебать спартак ебать"
        event1.image = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
        event1.likes = 100
        
        let event2 = Event()
        event2.name = "Ебать зенит ебать"
        event2.image = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
        event2.likes = 123
        
//        let event3 = Event()
//        event3.name = "ЦСКА пидоры без чести"
//        event3.image = "https://avatars.mds.yandex.net/get-zen_doc/1652143/pub_5d78ed79a06eaf3b9345e164_5d78edb880879d00c341f95e/scale_1200"
//        event3.likes = 4214
//
        
        self.events.append(contentsOf: [event1, event2])
    }
}
