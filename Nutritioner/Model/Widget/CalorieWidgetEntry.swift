//
//  CalorieWidgetEntry.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 12/18/20.
//

import Foundation
import WidgetKit

struct CalorieWidgetEntry: TimelineEntry {
    let date: Date
    let calories: Int
    let currentDay: String
    let mealCounter: Int
    let latestMeal: LatestMeal
}
