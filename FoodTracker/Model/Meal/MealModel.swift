//
//  MealModel.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/21/20.
//

import Foundation

struct MealModel: Identifiable {
    let id = UUID()
    var name: String
    var calories: String?
    var notes: String?
    var date: String
    var longDate: String
}
