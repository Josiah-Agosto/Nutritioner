//
//  FoodCell.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/21/20.
//

import Foundation

struct FoodCell: Identifiable {
    var id = UUID()
    var name: String
    var notes: String
    var date: String
    var calories: Int
}


extension String {
    /// Retrieves current time as String, HH:MM AM/PM.
    public func getCurrentTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: date)
    }
    
    /// Retrieves a date and formats it, then returns it.
    public func getCurrentDate() -> Date {
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        let stringFormat = formatter.string(from: date)
        guard let dateFromString = formatter.date(from: stringFormat) else { return Date() }
        return dateFromString
    }
    
    /// Converts String value to Double.
    public func convertToDouble(_ from: String) -> Double {
        let input = from
        guard input.isEmpty != true else { return 0.0 }
        guard let inputInt = Double(input) else { return 0.0 }
        return inputInt
    }
}
