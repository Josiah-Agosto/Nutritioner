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
        if (Int16(calories) != 0) { newMeal.calories = Double.convertToDouble(calories) }
        if (Int16(totalFat) != 0) { newMeal.totalFat = Double.convertToDouble(totalFat) }
        if (Int16(saturatedFat) != 0) { newMeal.saturatedFat = Double.convertToDouble(saturatedFat) }
        if (Int16(cholesterol) != 0) { newMeal.cholesterol = Double.convertToDouble(cholesterol) }
        if (Int16(sodium) != 0) { newMeal.sodium = Double.convertToDouble(sodium) }
        if (Int16(totalCarbohydrate) != 0) { newMeal.totalCarbohydrates = Double.convertToDouble(totalCarbohydrate) }
        if (Int16(fiber) != 0) { newMeal.fiber = Double.convertToDouble(fiber) }
        if (Int16(sugars) != 0) { newMeal.sugars = Double.convertToDouble(sugars) }
        if (Int16(protein) != 0) { newMeal.protein = Double.convertToDouble(protein) }
        if (Int16(vitaminA) != 0) { newMeal.vitaminA = Double.convertToDouble(vitaminA) }
        if (Int16(vitaminC) != 0) { newMeal.vitaminC = Double.convertToDouble(vitaminC) }
        if (Int16(calcium) != 0) { newMeal.calcium = Double.convertToDouble(calcium) }
        if (Int16(iron) != 0) { newMeal.iron = Double.convertToDouble(iron) }
        if (Int16(biotin) != 0) { newMeal.biotin = Double.convertToDouble(biotin) }
        if (Int16(caffeine) != 0) { newMeal.caffeine = Double.convertToDouble(caffeine) }
        if (Int16(chromium) != 0) { newMeal.chromium = Double.convertToDouble(chromium) }
        if (Int16(copper) != 0) { newMeal.copper = Double.convertToDouble(copper) }
        if (Int16(monounsaturatedFat) != 0) { newMeal.fatMonounsaturated = Double.convertToDouble(monounsaturatedFat) }
        if (Int16(polyunsaturatedFat) != 0) { newMeal.fatPolyunsaturated = Double.convertToDouble(polyunsaturatedFat) }
        if (Int16(folate) != 0) { newMeal.folate = Double.convertToDouble(folate) }
        if (Int16(iodine) != 0) { newMeal.iodine = Double.convertToDouble(iodine) }
        if (Int16(magnesium) != 0) { newMeal.magnesium = Double.convertToDouble(magnesium) }
        if (Int16(manganese) != 0) { newMeal.manganese = Double.convertToDouble(manganese) }
        if (Int16(molybdenum) != 0) { newMeal.molybdenum = Double.convertToDouble(molybdenum) }
        if (Int16(niacin) != 0) { newMeal.niacin = Double.convertToDouble(niacin) }
        if (Int16(pantothenicAcid) != 0) { newMeal.pantothenicAcid = Double.convertToDouble(pantothenicAcid) }
        if (Int16(phosphorus) != 0) { newMeal.phosphorus = Double.convertToDouble(phosphorus) }
        if (Int16(potassium) != 0) { newMeal.potassium = Double.convertToDouble(potassium) }
        if (Int16(riboflavin) != 0) { newMeal.riboflavin = Double.convertToDouble(riboflavin) }
        if (Int16(selenium) != 0) { newMeal.selenium = Double.convertToDouble(selenium) }
        if (Int16(vitaminE) != 0) { newMeal.vitaminE = Double.convertToDouble(vitaminE) }
        if (Int16(vitaminK) != 0) { newMeal.vitaminK = Double.convertToDouble(vitaminK) }
        if (Int16(vitaminB6) != 0) { newMeal.vitaminB6 = Double.convertToDouble(vitaminB6) }
        if (Int16(vitaminB12) != 0) { newMeal.vitaminB12 = Double.convertToDouble(vitaminB12) }
        if (Int16(vitaminD) != 0) { newMeal.vitaminD = Double.convertToDouble(vitaminD) }
        if (Int16(zinc) != 0) { newMeal.zinc = Double.convertToDouble(zinc) }
        //
        newMealCell.id = UUID()
        newMealCell.calories = Int16(calories) ?? 0
        newMealCell.date = String.getCurrentStringTime()
        newMealCell.longDate = String.getFullFormattedDateString()
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
