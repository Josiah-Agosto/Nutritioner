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
    private func addNewMeal(_ context: NSManagedObjectContext) {
        let newDay = Day(context: context)
        let newMealCell = MealCell(context: context)
        let newMeal = Meal(context: context)
        newMeal.calories = Double.convertToDouble(calories)
        newMeal.totalFat = Double.convertToDouble(totalFat)
        newMeal.saturatedFat = Double.convertToDouble(saturatedFat)
        newMeal.cholesterol = Double.convertToDouble(cholesterol)
        newMeal.sodium = Double.convertToDouble(sodium)
        newMeal.totalCarbohydrates = Double.convertToDouble(totalCarbohydrate)
        newMeal.fiber = Double.convertToDouble(fiber)
        newMeal.sugars = Double.convertToDouble(sugars)
        newMeal.protein = Double.convertToDouble(protein)
        newMeal.vitaminA = Double.convertToDouble(vitaminA)
        newMeal.vitaminC = Double.convertToDouble(vitaminC)
        newMeal.calcium = Double.convertToDouble(calcium)
        newMeal.iron = Double.convertToDouble(iron)
        newMeal.biotin = Double.convertToDouble(biotin)
        newMeal.caffeine = Double.convertToDouble(caffeine)
        newMeal.chromium = Double.convertToDouble(chromium)
        newMeal.copper = Double.convertToDouble(copper)
        newMeal.fatMonounsaturated = Double.convertToDouble(monounsaturatedFat)
        newMeal.fatPolyunsaturated = Double.convertToDouble(polyunsaturatedFat)
        newMeal.folate = Double.convertToDouble(folate)
        newMeal.iodine = Double.convertToDouble(iodine)
        newMeal.magnesium = Double.convertToDouble(magnesium)
        newMeal.manganese = Double.convertToDouble(manganese)
        newMeal.molybdenum = Double.convertToDouble(molybdenum)
        newMeal.niacin = Double.convertToDouble(niacin)
        newMeal.pantothenicAcid = Double.convertToDouble(pantothenicAcid)
        newMeal.phosphorus = Double.convertToDouble(phosphorus)
        newMeal.potassium = Double.convertToDouble(potassium)
        newMeal.riboflavin = Double.convertToDouble(riboflavin)
        newMeal.selenium = Double.convertToDouble(selenium)
        newMeal.vitaminE = Double.convertToDouble(vitaminE)
        newMeal.vitaminK = Double.convertToDouble(vitaminK)
        newMeal.vitaminB6 = Double.convertToDouble(vitaminB6)
        newMeal.vitaminB12 = Double.convertToDouble(vitaminB12)
        newMeal.vitaminD = Double.convertToDouble(vitaminD)
        newMeal.zinc = Double.convertToDouble(zinc)
        //
        newMealCell.id = UUID()
        newMealCell.calories = Int16(calories) ?? 0
        newMealCell.date = String.getCurrentStringTime()
        newMealCell.name = mealName
        newMealCell.notes = notesText
        newMealCell.addToMeal(newMeal)
        //
        newDay.id = UUID()
        newDay.date = String.getCurrentStringTime()
        newDay.addToMealCell(newMealCell)
        do {
            try context.save()
        } catch let error {
            print("Error saving to Core Data!, \(error.localizedDescription)")
        }
    }
    
    // MARK: - Actions
    public func addToHomeKitPressed(_ context: NSManagedObjectContext) {
        HealthKitStore(self).saveMealToHealthKit { (success) in
            if success {
                self.addNewMeal(context)
            } else {
                print("Error!")
            }
        }
    }
}
