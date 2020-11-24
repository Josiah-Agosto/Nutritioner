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
    /// Retrieves current time, HH:MM AM/PM.
    public func getCurrentTime() -> String {
        let date = Date()
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "h:mm a"
        formatter.amSymbol = "AM"
        formatter.pmSymbol = "PM"
        return formatter.string(from: date)
    }
}
