//
//  DateConverter.swift
//  Emovi
//
//  Created by  kirill on 03/09/2019.
//  Copyright © 2019  kirill. All rights reserved.
//

import Foundation

class DateConverter {

    static func getCurrentDateWithEmoviFormat() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        formatter.timeZone = TimeZone(abbreviation: "UTC")
        var myString = formatter.string(from: date) + "T"

        formatter.dateFormat = "HH-mm-ss"

        myString = myString + formatter.string(from: date) + "Z"

        return myString

    }

    static func convertStringEmoviDateToDate(stringDate: String) -> Date {

        let date = String(stringDate.dropLast(10))
        let time = String(stringDate.dropFirst(11).dropLast(1))

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let dateTime = dateFormatter.date(from: date + " " + time)
        return dateTime ?? Date()
    }

    static func convertStringEmoviDateToString(stringDate: String) -> (String, String) {

        let date = String(stringDate.dropLast(10))
        let time = String(stringDate.dropFirst(11).dropLast(4))
        
        let newString = date.replacingOccurrences(of: "-", with: ".", options: .literal, range: nil)
        let lastString = String(newString.dropFirst(8)) + "." + String(newString.dropFirst(5).dropLast(3)) + "." + String(newString.dropLast(8))
            
        return (lastString, time)
    }
    
    static func getCurrentDateWithEmoviFormatLastLogin() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"

        var myString = formatter.string(from: date) + " "

        formatter.dateFormat = "HH:mm:ss"

        myString = myString + formatter.string(from: date) + ".000000"

        return myString
    }

    static func convertTimeStringToTimeStamp(string: String) -> Date {
        let date = string
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = .current
        dateFormatter.dateFormat = "dd.MM.yyyy, HH:mm"
        let dateTimeOld = dateFormatter.date(from: date)

        dateFormatter.timeZone = TimeZone(abbreviation: "UTC")

        let dateTimeNewString = dateFormatter.string(from: dateTimeOld ?? Date())

        let dateTime = dateFormatter.date(from: dateTimeNewString)
        return dateTime ?? Date()
    }

}
