//
//  CoreDataModelExtensions.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/29/20.
//

import Foundation
import CoreData

// MARK: - Meal Cell Extension
extension MealCell {
    @objc(addMeal:)
    @NSManaged public func addMeal(_ value: Meal)
    
    @objc(removeMeal:)
    @NSManaged public func removeMeal(_ value: Meal)
}

// MARK: - Day Extension
extension Day {
    @objc(addMealCell:)
    @NSManaged public func addMealCell(_ value: MealCell)
    
    @objc(removeMealCell:)
    @NSManaged public func removeMealCell(_ value: MealCell)
}
