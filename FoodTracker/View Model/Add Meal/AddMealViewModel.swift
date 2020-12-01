//
//  AddMealViewModel.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/26/20.
//

import SwiftUI
import Combine
import CoreData

class AddMealViewModel: ObservableObject {
    // MARK: - References / Properties
    @Environment(\.managedObjectContext) var managedObjectContext
    // MARK: - Add Meal View
    // Add Meal Properties
    @Published var mealName: String = ""
    @Published var servingSize: String = ""
    @Published var servingsPerContainer: String = ""
    @Published var calories: String = ""
    @Published var totalFat: String = ""
    @Published var saturatedFat: String = ""
    @Published var transFat: String = ""
    @Published var cholesterol: String = ""
    @Published var sodium: String = ""
    @Published var totalCarbohydrate: String = ""
    @Published var fiber: String = ""
    @Published var sugars: String = ""
    @Published var protein: String = ""
    @Published var vitaminA: String = ""
    @Published var vitaminC: String = ""
    @Published var calcium: String = ""
    @Published var iron: String = ""
    @Published var biotin: String = ""
    @Published var zinc: String = ""
    @Published var niacin: String = ""
    @Published var folate: String = ""
    @Published var iodine: String = ""
    @Published var copper: String = ""
    @Published var thiamin: String = ""
    @Published var selenium: String = ""
    @Published var chromium: String = ""
    @Published var chloride: String = ""
    @Published var caffeine: String = ""
    @Published var magnesium: String = ""
    @Published var manganese: String = ""
    @Published var potassium: String = ""
    @Published var riboflavin: String = ""
    @Published var phosphorus: String = ""
    @Published var molybdenum: String = ""
    @Published var carbohydrates: String = ""
    @Published var vitaminD: String = ""
    @Published var vitaminE: String = ""
    @Published var vitaminK: String = ""
    @Published var vitaminB6: String = ""
    @Published var vitaminB12: String = ""
    @Published var pantothenicAcid: String = ""
    @Published var polyunsaturatedFat: String = ""
    @Published var monounsaturatedFat: String = ""
    // MARK: - Add Nutrition View
    // Text Field
    @Published var placeholderText: String = ""
    @Published var notesText: String = ""
    @Published var notesTextHeight: CGFloat = 0
    
    /// Adds Meal to Core Data
    public func addNewMeal() {
        let newDay = Day(context: managedObjectContext)
        let newMealCell = MealCell(context: managedObjectContext)
        let newMeal = Meal(context: managedObjectContext)
        newMeal.calories = 0.0.convertToDouble(calories)
        newMeal.totalFat = 0.0.convertToDouble(totalFat)
        newMeal.saturatedFat = 0.0.convertToDouble(saturatedFat)
        newMeal.cholesterol = 0.0.convertToDouble(cholesterol)
        newMeal.sodium = 0.0.convertToDouble(sodium)
        newMeal.totalCarbohydrates = 0.0.convertToDouble(totalCarbohydrate)
        newMeal.fiber = 0.0.convertToDouble(fiber)
        newMeal.sugars = 0.0.convertToDouble(sugars)
        newMeal.protein = 0.0.convertToDouble(protein)
        newMeal.vitaminA = 0.0.convertToDouble(vitaminA)
        newMeal.vitaminC = 0.0.convertToDouble(vitaminC)
        newMeal.calcium = 0.0.convertToDouble(calcium)
        newMeal.iron = 0.0.convertToDouble(iron)
        newMeal.biotin = 0.0.convertToDouble(biotin)
        newMeal.caffeine = 0.0.convertToDouble(caffeine)
        newMeal.chromium = 0.0.convertToDouble(chromium)
        newMeal.copper = 0.0.convertToDouble(copper)
        newMeal.fatMonounsaturated = 0.0.convertToDouble(monounsaturatedFat)
        newMeal.fatPolyunsaturated = 0.0.convertToDouble(polyunsaturatedFat)
        newMeal.folate = 0.0.convertToDouble(folate)
        newMeal.iodine = 0.0.convertToDouble(iodine)
        newMeal.magnesium = 0.0.convertToDouble(magnesium)
        newMeal.manganese = 0.0.convertToDouble(manganese)
        newMeal.molybdenum = 0.0.convertToDouble(molybdenum)
        newMeal.niacin = 0.0.convertToDouble(niacin)
        newMeal.pantothenicAcid = 0.0.convertToDouble(pantothenicAcid)
        newMeal.phosphorus = 0.0.convertToDouble(phosphorus)
        newMeal.potassium = 0.0.convertToDouble(potassium)
        newMeal.riboflavin = 0.0.convertToDouble(riboflavin)
        newMeal.selenium = 0.0.convertToDouble(selenium)
        newMeal.vitaminE = 0.0.convertToDouble(vitaminE)
        newMeal.vitaminK = 0.0.convertToDouble(vitaminK)
        newMeal.vitaminB6 = 0.0.convertToDouble(vitaminB6)
        newMeal.vitaminB12 = 0.0.convertToDouble(vitaminB12)
        newMeal.vitaminD = 0.0.convertToDouble(vitaminD)
        newMeal.zinc = 0.0.convertToDouble(zinc)
        //
        newMealCell.calories = 0.0.convertToDouble(calories)
        newMealCell.date = Date().getFullFormattedDate()
        newMealCell.name = mealName
        newMealCell.notes = notesText
        newMealCell.addToMeal(newMeal)
        //
        newDay.date = Date().getFullFormattedDate()
        newDay.addToMealCell(newMealCell)
        PersistentCloudKitContainer.saveContext()
    }
    
}
