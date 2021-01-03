//
//  DayModel.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 12/11/20.
//

import Foundation

struct DayModel: Identifiable {
    let id = UUID()
    var date: String
    var totalCalories: String?
    var mealModel: MealModel
}
