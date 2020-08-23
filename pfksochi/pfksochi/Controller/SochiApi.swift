//
//  SochiApi.swift
//  pfksochi
//
//  Created by  kirill on 22.08.2020.
//  Copyright © 2020  kirill. All rights reserved.
//

import Foundation
import Moya

let API_ROOT = "https://sochi-backend.herokuapp.com/api"
enum SochiApi {
    case getEvents
    case createEvent(userId: Int, name: String, description: String, photo: String)
    case getNextMatch
    case createTicket(userId: Int)
    case sendLike(userId: Int, eventId: Int)
    case deleteLike(userId: Int, eventId: Int)
}
//https://sochi-backend.herokuapp.com/api/events
//
//https://sochi-backend.herokuapp.com/api/users/1/events/create
//https://sochi-backend.herokuapp.com/api/users/1/events/like/<event_id>/delete
//https://sochi-backend.herokuapp.com/api/matches/next
//https://sochi-backend.herokuapp.com/api/users/1/events/like

//https://sochi-backend.herokuapp.com/api/users/1/tickets/create
extension SochiApi: TargetType, AccessTokenAuthorizable {
    var headers: [String : String]? {
        return ["":""]
    }
    

    var baseURL: URL {
        return URL(string: "\(API_ROOT)")!
    }

    var authorizationType: AuthorizationType? {
        switch self {
        case .getEvents, .createEvent, .getNextMatch, .createTicket, .sendLike, .deleteLike:
            return .custom("Token")
        }
    }
    var path: String {
        switch self {
        case .getEvents:
            return "/events"
        case .createEvent(let userId,_,_,_):
            return "/users/\(userId)/events/create"
        case .getNextMatch:
            return "/matches/next"
        case .createTicket(let userId):
            return "/users/\(userId)/tickets/create"
        case .sendLike(let userId, _):
            return "/users/\(userId)/events/like"
        case .deleteLike(let userId, let eventId):
            return "/users/\(userId)/events/like/\(eventId)/delete"
        }
    }
    var method: Moya.Method {
        switch self {
        case .getEvents, .getNextMatch:
            return .get
        case .createTicket, .createEvent, .sendLike:
            return .post
        case .deleteLike:
            return .delete
        }
    }
    var task: Task {
        switch self {
        case .getEvents, .getNextMatch, .createTicket, .deleteLike:
            return .requestPlain
        case let .createEvent(_, name, description, photo):
            return .requestParameters(parameters: ["name": name, "description": description, "photo": photo], encoding: JSONEncoding.default)
        case let .sendLike(_, eventId):
            return .requestParameters(parameters: ["event": eventId], encoding: JSONEncoding.default)
       
        }
    }

    var sampleData: Data {
        switch self {
        case .getEvents, .getNextMatch, .createTicket, .createEvent, .deleteLike, .sendLike:
            return "{}".utf8Encoded
        }
    }
//    var headers: [String: String]? {
//        switch self {
//            return .
////        case .getMovieEmotions, .searchByEmotionIds, .searchAdvanced, .getMoviesByIds, .searchNextPage, .searchByText, .searchNextPageNoAuth, .searchByUsername, .getWatchlistForUser, .getWatchedForUser, .getMatchForUsers, .sendRecommendations:
////                return ["Content-type": "application/json", "API-Key": "LuRUypuhjS4RTVa2HrLv8VW3GFFhHu", "Accept-Language": Locale.current.getLanguageSmart()]
////        case .getMovieById:
////                return ["Content-type": "application/json", "API-Key": "LuRUypuhjS4RTVa2HrLv8VW3GFFhHu", "Accept-Language": Locale.current.getLanguageSmart(),
////                        "User-Country": Locale.current.getCoutrySmart()]
////        }
//
//    }
}

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }

    var utf8Encoded: Data {
        return data(using: .utf8)!
    }
}
