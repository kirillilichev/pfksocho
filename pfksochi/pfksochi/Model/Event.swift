//
//  Event.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation

class Event: Decodable {
    var name: String?
    var likes: Int?
    var photo: String?
//    var enemyEvent = false
    
    var id: Int?
    var description: String?
    var match: Int?
    var tags: [Tag]?
    var is_home_event: Bool?
    var has_liked: Bool?
//    "id": 4,
//    "name": "Поехали в Краснодар на выездную игру",
//    "description": "Мы собираемся с ребятами поехать в Краснодар поддержать \"барсов\". Для этого планируется снять автобус, оставляйте в комментах плюсы, модератор соберет нас всех и мы поедем все вместе!",
//    "photo": "https://www.soccer.ru/sites/default/files/styles/content_image/public/blogs/records/kerzh.jpg?itok=o0BoLSaD",
//    "likes": 0,
//    "author": 1,
//    "match": null,
//    "tags": null
}


class Tag: Decodable {
    var name: String?
    var type: Int?
}
