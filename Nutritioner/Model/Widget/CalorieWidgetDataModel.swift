//
//  CalorieWidgetDataModel.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 12/19/20.
//

import Foundation

struct CalorieWidgetDataModel: Encodable {
    let calories: Int
    let currentDay: String
    let mealCounter: Int
    let latestMeal: LatestMeal
}


struct LatestMeal: Encodable {
    let mealTitle: String
    let mealTime: String
    let mealCalories: String
}
