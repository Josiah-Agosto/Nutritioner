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
    
    // MARK: - Public Functions
    /// Adds Meal to Core Data
    public func addNewMeal(_ context: NSManagedObjectContext) {
        let newDay = Day(context: context)
        let newMealCell = MealCell(context: context)
        let newMeal = Meal(context: context)
        newMeal.calories = Double(calories) ?? 0.0
        newMeal.totalFat = Double(totalFat) ?? 0.0
        newMeal.saturatedFat = Double(saturatedFat) ?? 0.0
        newMeal.cholesterol = Double(cholesterol) ?? 0.0
        newMeal.sodium = Double(sodium) ?? 0.0
        newMeal.totalCarbohydrates = Double(totalCarbohydrate) ?? 0.0
        newMeal.fiber = Double(fiber) ?? 0.0
        newMeal.sugars = Double(sugars) ?? 0.0
        newMeal.protein = Double(protein) ?? 0.0
        newMeal.vitaminA = Double(vitaminA) ?? 0.0
        newMeal.vitaminC = Double(vitaminC) ?? 0.0
        newMeal.calcium = Double(calcium) ?? 0.0
        newMeal.iron = Double(iron) ?? 0.0
        newMeal.biotin = Double(biotin) ?? 0.0
        newMeal.caffeine = Double(caffeine) ?? 0.0
        newMeal.chromium = Double(chromium) ?? 0.0
        newMeal.copper = Double(copper) ?? 0.0
        newMeal.fatMonounsaturated = Double(monounsaturatedFat) ?? 0.0
        newMeal.fatPolyunsaturated = Double(polyunsaturatedFat) ?? 0.0
        newMeal.folate = Double(folate) ?? 0.0
        newMeal.iodine = Double(iodine) ?? 0.0
        newMeal.magnesium = Double(magnesium) ?? 0.0
        newMeal.manganese = Double(manganese) ?? 0.0
        newMeal.molybdenum = Double(molybdenum) ?? 0.0
        newMeal.niacin = Double(niacin) ?? 0.0
        newMeal.pantothenicAcid = Double(pantothenicAcid) ?? 0.0
        newMeal.phosphorus = Double(phosphorus) ?? 0.0
        newMeal.potassium = Double(potassium) ?? 0.0
        newMeal.riboflavin = Double(riboflavin) ?? 0.0
        newMeal.selenium = Double(selenium) ?? 0.0
        newMeal.vitaminE = Double(vitaminE) ?? 0.0
        newMeal.vitaminK = Double(vitaminK) ?? 0.0
        newMeal.vitaminB6 = Double(vitaminB6) ?? 0.0
        newMeal.vitaminB12 = Double(vitaminB12) ?? 0.0
        newMeal.vitaminD = Double(vitaminD) ?? 0.0
        newMeal.zinc = Double(zinc) ?? 0.0
        //
        newMealCell.id = UUID(uuidString: mealName)
        newMealCell.calories = Int16(calories) ?? 0
        newMealCell.date = Date().getCurrentFullDate()
        newMealCell.name = mealName
        newMealCell.notes = notesText
        newMealCell.addToMeal(newMeal)
        //
        newDay.date = Date().getFullFormattedDate()
        newDay.addToMealCell(newMealCell)
        do {
            try context.save()
            print("Saved to Core Data!")
        } catch let error {
            print("Error saving to Core Data!, \(error.localizedDescription)")
        }
    }
    
    // MARK: - Actions
    public func addToHomeKitPressed(_ context: NSManagedObjectContext) {
        addNewMeal(context)
        HealthKitStore(self).saveMealToHealthKit { (success) in
            if success {
                print("Successful, Check HealthKit.")
            } else {
                print("Error!")
            }
        }
    }
}
