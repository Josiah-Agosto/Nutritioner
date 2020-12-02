//
//  FoodTrackerExtensions.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/30/20.
//

import Foundation

extension String {
    /// Retrieves current time as String, HH:MM AM/PM.
    public func getCurrentStringTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: date)
    }
    
    /// Returns current day name.
    public func getCurrentDay() -> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        let dayString = dateFormatter.string(from: date)
        return dayString
    }
}



extension Date {
    /// Retrieves a date and formats it, then returns it ex: Hour:Minute am/pm.
    public func getCurrentFullDate() -> Date {
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        formatter.dateFormat = "h:mm a"
        let stringFormat = formatter.string(from: date)
        guard let dateFromString = formatter.date(from: stringFormat) else { return Date() }
        return dateFromString
    }
    
    /// Returns full date formatted, ex: FullDay, FullMonth,Day, Year, Hour:Minute:Second am/pm.
    public func getFullFormattedDate() -> Date {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.amSymbol = "AM"
        dateFormatter.pmSymbol = "PM"
        dateFormatter.dateFormat = "EEEE,MMMM,dd,y h:mm:s a"
        let fullDate = dateFormatter.string(from: date)
        guard let dateFromString = dateFormatter.date(from: fullDate) else { return Date() }
        return dateFromString
    }
}


extension Double {
    /// Converts String value to Double.
    public func convertToDouble(_ from: String) -> Double {
        let input = from
        guard input.isEmpty != true else { return 0.0 }
        guard let inputInt = Double(input) else { return 0.0 }
        return inputInt
    }
}
