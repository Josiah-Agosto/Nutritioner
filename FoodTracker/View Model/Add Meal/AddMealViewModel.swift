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
    @Published var notesText: String = ""
    @Published var notesTextHeight: CGFloat = 0
    
    ///
    public func addNewMeal() {
        let newDay = Day(context: managedObjectContext)
        let newMealCell = MealCell(context: managedObjectContext)
        let newMeal = Meal(context: managedObjectContext)
        newMeal.calories = calories.convertToDouble(calories)
        newMeal.totalFat = totalFat.convertToDouble(totalFat)
        newMeal.saturatedFat = saturatedFat.convertToDouble(saturatedFat)
        newMeal.cholesterol = cholesterol.convertToDouble(cholesterol)
        newMeal.sodium = sodium.convertToDouble(sodium)
        newMeal.totalCarbohydrates = totalCarbohydrate.convertToDouble(totalCarbohydrate)
        newMeal.fiber = fiber.convertToDouble(fiber)
        newMeal.sugars = sugars.convertToDouble(sugars)
        newMeal.protein = protein.convertToDouble(protein)
        newMeal.vitaminA = vitaminA.convertToDouble(vitaminA)
        newMeal.vitaminC = vitaminC.convertToDouble(vitaminC)
        newMeal.calcium = calcium.convertToDouble(calcium)
        newMeal.iron = iron.convertToDouble(iron)
        newMeal.biotin = biotin.convertToDouble(biotin)
        newMeal.caffeine = caffeine.convertToDouble(caffeine)
        newMeal.chromium = chromium.convertToDouble(chromium)
        newMeal.copper = copper.convertToDouble(copper)
        newMeal.fatMonounsaturated = monounsaturatedFat.convertToDouble(monounsaturatedFat)
        newMeal.fatPolyunsaturated = polyunsaturatedFat.convertToDouble(polyunsaturatedFat)
        newMeal.folate = folate.convertToDouble(folate)
        newMeal.iodine = iodine.convertToDouble(iodine)
        newMeal.magnesium = magnesium.convertToDouble(magnesium)
        newMeal.manganese = manganese.convertToDouble(manganese)
        newMeal.molybdenum = molybdenum.convertToDouble(molybdenum)
        newMeal.niacin = niacin.convertToDouble(niacin)
        newMeal.pantothenicAcid = pantothenicAcid.convertToDouble(pantothenicAcid)
        newMeal.phosphorus = phosphorus.convertToDouble(phosphorus)
        newMeal.potassium = potassium.convertToDouble(potassium)
        newMeal.riboflavin = riboflavin.convertToDouble(riboflavin)
        newMeal.selenium = selenium.convertToDouble(selenium)
        newMeal.vitaminE = vitaminE.convertToDouble(vitaminE)
        newMeal.vitaminK = vitaminK.convertToDouble(vitaminK)
        newMeal.vitaminB6 = vitaminB6.convertToDouble(vitaminB6)
        newMeal.vitaminB12 = vitaminB12.convertToDouble(vitaminB12)
        newMeal.vitaminD = vitaminD.convertToDouble(vitaminD)
        newMeal.zinc = zinc.convertToDouble(zinc)
        //
        newMealCell.calories = newMeal.calories
        newMealCell.date = "".getCurrentDate()
        newMealCell.name = mealName
//        newMealCell.addToMeal(newMeal)
        //
        PersistentCloudKitContainer.saveContext()
    }
    
}
