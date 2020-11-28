//
//  AddMealViewModel.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/26/20.
//

import SwiftUI
import Combine
import CoreData

class AddMealViewModel {
    // MARK: - References / Properties
    @Environment(\.managedObjectContext) var managedObjectContext
    
    ///
    public func addNewMeal(_ servingSize: String, _ servingsPerContainer: String, _ calories: Int, _ caloriesFromFat: Int, _ totalFat: String, _ saturatedFat: String, _ transFat: String, _ cholesterol: String, _ sodium: String, _ totalCarbohydrates: String, _ dietaryFiber: String, _ sugars: String, _ protein: String, _ vitaminA: String, _ vitaminC: String, _ calcium: String, _ iron: String, _ extraArguments: [String]? = nil) {
        let newMeal = Meal(context: managedObjectContext)
        newMeal.servingSize = servingSize
        newMeal.servingsPerContainer = servingsPerContainer
        newMeal.calories = String(calories)
        newMeal.caloriesFromFat = String(caloriesFromFat)
        newMeal.totalFat = totalFat
        newMeal.saturatedFat = saturatedFat
        newMeal.transFat = transFat
        newMeal.cholesterol = cholesterol
        newMeal.sodium = sodium
        newMeal.totalCarbohydrates = totalCarbohydrates
        newMeal.dietaryFiber = dietaryFiber
        newMeal.sugars = sugars
        newMeal.protein = protein
        newMeal.vitaminA = vitaminA
        newMeal.vitaminC = vitaminC
        newMeal.calcium = calcium
        newMeal.iron = iron
        // TODO: Add all possible Nutrition Facts
        PersistentCloudKitContainer.saveContext()
    }
    
}
