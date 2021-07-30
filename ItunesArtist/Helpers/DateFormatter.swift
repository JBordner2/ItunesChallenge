//
//  DateFormatter.swift
//  ItunesArtist
//
//  Created by Jack Bordner on 7/29/21.
//

import Foundation

enum StringDateFormatter {
    case dayMonthYear
    
    func formatAsString(for string: String) -> String {
        switch self {
        case .dayMonthYear:
            let dateString = string
             let formatter = DateFormatter()
             formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
             guard let date = formatter.date(from: dateString) else {
                return ""
             }
            
            formatter.dateFormat = "yyyy"
            let year = formatter.string(from: date)
            formatter.dateFormat = "MM"
            let monthInt = Int(formatter.string(from: date))
            
            //Curious what team thinks. I can't test this return case because given the date format above in formatter instance, a date cannot exist without a month.
            guard var zeroIndexedMonth = monthInt else {
                return ""
            }
            
            zeroIndexedMonth -= 1
            let shortMonthStr = formatter.shortMonthSymbols[zeroIndexedMonth]
            
            formatter.dateFormat = "dd"
            let day = formatter.string(from: date)
            
            return "\(shortMonthStr) \(day), \(year)"
        }
    }
}
