//
//  SharedData.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 12/19/20.
//

import Foundation

class SharedData {
    // MARK: - References / Properties
    static let shared = SharedData()
    
    public func addValuesToPlist(_ totalCalories: Int, _ currentDay: String, _ mealCounter: Int) {
        let urlPath = FileManager.sharedContainerUrl().appendingPathComponent("WidgetData.plist")
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml
        let caloriesWidget = CalorieWidgetDataModel(calories: totalCalories, currentDay: currentDay, mealCounter: mealCounter)
        do {
            let data = try encoder.encode(caloriesWidget)
            try data.write(to: urlPath)
        } catch let error {
            print("Error, \(error.localizedDescription)")
        }
    }
}



// MARK: - File Manager Extension
extension FileManager {
    // Links container with this identifier
    static func sharedContainerUrl() -> URL {
        return FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: "group.com.JosiahAgosto")!
    }
}
