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
    // Add Nutrition Properties
    @Published var addNutritionData = Nutrient.allCases
    @Published var selectedNutrient = Nutrient.dietaryServingSize
    @Published var selectedBinding: String = ""
    // Text Field
    @Published var placeholderText: String = ""
    @Published var inputedText: String = ""
    
    ///
    public func addNewMeal() {
        let newDay = Day(context: managedObjectContext)
        let newMealCell = MealCell(context: managedObjectContext)
        let newMeal = Meal(context: managedObjectContext)
        newMeal.calories = calories
        newMeal.totalFat = totalFat
        newMeal.saturatedFat = saturatedFat
        newMeal.cholesterol = cholesterol
        newMeal.sodium = sodium
        newMeal.totalCarbohydrates = totalCarbohydrate
        newMeal.fiber = fiber
        newMeal.sugars = sugars
        newMeal.protein = protein
        newMeal.vitaminA = vitaminA
        newMeal.vitaminC = vitaminC
        newMeal.calcium = calcium
        newMeal.iron = iron
        newMeal.biotin = biotin
        newMeal.caffeine = caffeine
        newMeal.chromium = chromium
        newMeal.copper = copper
        newMeal.fatMonounsaturated = monounsaturatedFat
        newMeal.fatPolyunsaturated = polyunsaturatedFat
        newMeal.folate = folate
        newMeal.iodine = iodine
        newMeal.magnesium = magnesium
        newMeal.manganese = manganese
        newMeal.molybdenum = molybdenum
        newMeal.niacin = niacin
        newMeal.pantothenicAcid = pantothenicAcid
        newMeal.phosphorus = phosphorus
        newMeal.potassium = potassium
        newMeal.riboflavin = riboflavin
        newMeal.selenium = selenium
        newMeal.vitaminE = vitaminE
        newMeal.vitaminK = vitaminK
        newMeal.vitaminB6 = vitaminB6
        newMeal.vitaminB12 = vitaminB12
        newMeal.vitaminD = vitaminD
        newMeal.zinc = zinc
        //
        PersistentCloudKitContainer.saveContext()
    }
    
}
