//
//  CalorieWidgetDataModel.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 12/19/20.
//

import Foundation

struct CalorieWidgetDataModel: Encodable {
    let calories: Int
    let currentDay: String
    let mealCounter: Int
}
