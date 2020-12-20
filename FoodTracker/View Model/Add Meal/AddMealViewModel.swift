//
//  AddMealViewModel.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/26/20.
//

import UIKit
import CoreData

final class AddMealViewModel: ObservableObject {
    // MARK: - References / Properties
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
    @Published var tappedViewPosition: CGFloat = 0
    
    // MARK: - Public Functions
    /// Adds Meal to Core Data
    private func addNewMeal() {
        let nutrient = NutrientsModel(calories: calories, fatTotal: totalFat, fatSaturated: saturatedFat, cholesterol: cholesterol, sodium: sodium, fiber: fiber, protein: protein, vitaminA: vitaminA, vitaminC: vitaminC, calcium: calcium, iron: iron, biotin: biotin, zinc: zinc, sugar: sugars, niacin: niacin, folate: folate, iodine: iodine, copper: copper, thiamin: thiamin, selenium: selenium, chromium: chromium, caffeine: caffeine, magnesium: magnesium, manganese: manganese, potassium: potassium, riboflavin: riboflavin, phosphorus: phosphorus, molybdenum: molybdenum, carbohydrates: carbohydrates, vitaminD: vitaminD, vitaminE: vitaminE, vitaminK: vitaminK, vitaminB6: vitaminB6, vitaminB12: vitaminB12, pantothenicAcid: pantothenicAcid, fatPolyunsaturated: polyunsaturatedFat, fatMonounsaturated: monounsaturatedFat)
        let meal = MealModel(name: mealName, calories: calories, notes: notesText, date: String.getCurrentStringTime(), longDate: String.getCurrentStringDate())
        let day = DayModel(date: String.getCurrentStringDate(), totalCalories: calories, mealModel: meal)
        DataManager.shared.addFullMeal(with: nutrient, meal, day)
        CoreDataHelper.shared.saveToContext()
    }
    
    /// Returns second half of screen.
    public func isViewInSecondPortionOfView(_ mid: CGFloat, _ tappedViewPosition: CGFloat) -> Bool {
        if tappedViewPosition >= mid {
            return true
        } else {
            return false
        }
    }
    
    // MARK: - Actions
    public func addToHomeKitAndCoreData() {
        HealthKitStore(self).saveMealToHealthKit { (success) in
            if success {
                self.addNewMeal()
            } else {
                print("Error! Health Kit.")
            }
        }
    }

}
