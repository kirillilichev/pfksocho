//
//  Match.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation

class Match: Decodable {

    var id: Int?
    var stadium: String?
    var date_time: String?
    var home_club: Club?
    var guest_club: Club?
    var season: String?
    var tournament: String?
//    "id": 1,
//    "stadium": "Стадион \"Фишт\"",
//    "date_time": "2020-08-22T14:00:00Z",
//    "home_club": 2,
//    "guest_club": 1,
//    "season": null,
//    "tournament": null
}
