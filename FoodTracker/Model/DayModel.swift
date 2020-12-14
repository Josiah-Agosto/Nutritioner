//
//  DayModel.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 12/11/20.
//

import Foundation

struct DayModel: Identifiable {
    let id = UUID()
    var date: String
    var mealModel: MealModel
}
