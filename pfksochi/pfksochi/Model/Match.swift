//
//  Match.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation

class Match: Decodable {
    var date: String? = "22 августа, суббота"
    var time: String? = "14:00 МСК"
    var place: String? = "Стадион \"Фишт\""
    var teamHome: String? = "Сочи"
    var cityHome: String? = "Сочи"
    var teamGuest: String? = "Спартак"
    var cityGuest: String? = "Москва"
}
