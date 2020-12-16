//
//  DataManager.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 12/11/20.
//

import Foundation

protocol DataManagerProtocol {
    func fetchMeal(from date: String) -> [MealCell]
    func fetchDay() -> [Day]
    func addFullMeal(with nutrients: NutrientsModel, _ meal: MealModel, _ day: DayModel)
}

class DataManager: DataManagerProtocol {
    // MARK: References / Properties
    static let shared = DataManager()
    public let coreDataHelper = CoreDataHelper.shared
    
    // MARK: - Protocol Methods
    /// Fetches Meal Cells for Day.
    func fetchMeal(from date: String) -> [MealCell] {
        let predicate = NSPredicate(format: "date = %@", date as CVarArg)
        let result = coreDataHelper.fetch(MealCell.self, predicate: predicate, limit: nil)
        switch result {
            case .success(let mealCell):
                return mealCell
            case .failure(_):
                return []
        }
    }
    
    /// Fetches A Day with a predicate of dayModel is same as Core data data.
    func fetchDay() -> [Day] {
//        let predicate = NSPredicate(format: "date = %@", dayModel.date as CVarArg)
        let result = coreDataHelper.fetch(Day.self, predicate: nil, limit: nil)
        switch result {
            case .success(let day):
                print(day)
                return day
            case .failure(_):
                return []
        }
    }

    /// Creates Nutrients.
    private func addNutrients(_ nutrientsModel: NutrientsModel) -> Meal {
        let mealEntity = Meal.entity()
        let newNutrients = Meal(entity: mealEntity, insertInto: coreDataHelper.context)
        if (Int16(nutrientsModel.calories) != 0) { newNutrients.calories = Double.convertToDouble(nutrientsModel.calories) }
        if (Int16(nutrientsModel.fatTotal) != 0) { newNutrients.totalFat = Double.convertToDouble(nutrientsModel.fatTotal) }
        if (Int16(nutrientsModel.fatSaturated) != 0) { newNutrients.saturatedFat = Double.convertToDouble(nutrientsModel.fatSaturated) }
        if (Int16(nutrientsModel.cholesterol) != 0) { newNutrients.cholesterol = Double.convertToDouble(nutrientsModel.cholesterol) }
        if (Int16(nutrientsModel.sodium) != 0) { newNutrients.sodium = Double.convertToDouble(nutrientsModel.sodium) }
        if (Int16(nutrientsModel.carbohydrates) != 0) { newNutrients.carbohydrates = Double.convertToDouble(nutrientsModel.carbohydrates) }
        if (Int16(nutrientsModel.fiber) != 0) { newNutrients.fiber = Double.convertToDouble(nutrientsModel.fiber) }
        if (Int16(nutrientsModel.sugar) != 0) { newNutrients.sugars = Double.convertToDouble(nutrientsModel.sugar) }
        if (Int16(nutrientsModel.protein) != 0) { newNutrients.protein = Double.convertToDouble(nutrientsModel.protein) }
        if (Int16(nutrientsModel.vitaminA) != 0) { newNutrients.vitaminA = Double.convertToDouble(nutrientsModel.vitaminA) }
        if (Int16(nutrientsModel.vitaminC) != 0) { newNutrients.vitaminC = Double.convertToDouble(nutrientsModel.vitaminC) }
        if (Int16(nutrientsModel.calcium) != 0) { newNutrients.calcium = Double.convertToDouble(nutrientsModel.calcium) }
        if (Int16(nutrientsModel.iron) != 0) { newNutrients.iron = Double.convertToDouble(nutrientsModel.iron) }
        if (Int16(nutrientsModel.biotin) != 0) { newNutrients.biotin = Double.convertToDouble(nutrientsModel.biotin) }
        if (Int16(nutrientsModel.caffeine) != 0) { newNutrients.caffeine = Double.convertToDouble(nutrientsModel.caffeine) }
        if (Int16(nutrientsModel.chromium) != 0) { newNutrients.chromium = Double.convertToDouble(nutrientsModel.chromium) }
        if (Int16(nutrientsModel.copper) != 0) { newNutrients.copper = Double.convertToDouble(nutrientsModel.copper) }
        if (Int16(nutrientsModel.fatMonounsaturated) != 0) { newNutrients.fatMonounsaturated = Double.convertToDouble(nutrientsModel.fatMonounsaturated) }
        if (Int16(nutrientsModel.fatPolyunsaturated) != 0) { newNutrients.fatPolyunsaturated = Double.convertToDouble(nutrientsModel.fatPolyunsaturated) }
        if (Int16(nutrientsModel.folate) != 0) { newNutrients.folate = Double.convertToDouble(nutrientsModel.folate) }
        if (Int16(nutrientsModel.iodine) != 0) { newNutrients.iodine = Double.convertToDouble(nutrientsModel.iodine) }
        if (Int16(nutrientsModel.magnesium) != 0) { newNutrients.magnesium = Double.convertToDouble(nutrientsModel.magnesium) }
        if (Int16(nutrientsModel.manganese) != 0) { newNutrients.manganese = Double.convertToDouble(nutrientsModel.manganese) }
        if (Int16(nutrientsModel.molybdenum) != 0) { newNutrients.molybdenum = Double.convertToDouble(nutrientsModel.molybdenum) }
        if (Int16(nutrientsModel.niacin) != 0) { newNutrients.niacin = Double.convertToDouble(nutrientsModel.niacin) }
        if (Int16(nutrientsModel.pantothenicAcid) != 0) { newNutrients.pantothenicAcid = Double.convertToDouble(nutrientsModel.pantothenicAcid) }
        if (Int16(nutrientsModel.phosphorus) != 0) { newNutrients.phosphorus = Double.convertToDouble(nutrientsModel.phosphorus) }
        if (Int16(nutrientsModel.potassium) != 0) { newNutrients.potassium = Double.convertToDouble(nutrientsModel.potassium) }
        if (Int16(nutrientsModel.riboflavin) != 0) { newNutrients.riboflavin = Double.convertToDouble(nutrientsModel.riboflavin) }
        if (Int16(nutrientsModel.selenium) != 0) { newNutrients.selenium = Double.convertToDouble(nutrientsModel.selenium) }
        if (Int16(nutrientsModel.vitaminE) != 0) { newNutrients.vitaminE = Double.convertToDouble(nutrientsModel.vitaminE) }
        if (Int16(nutrientsModel.vitaminK) != 0) { newNutrients.vitaminK = Double.convertToDouble(nutrientsModel.vitaminK) }
        if (Int16(nutrientsModel.vitaminB6) != 0) { newNutrients.vitaminB6 = Double.convertToDouble(nutrientsModel.vitaminB6) }
        if (Int16(nutrientsModel.vitaminB12) != 0) { newNutrients.vitaminB12 = Double.convertToDouble(nutrientsModel.vitaminB12) }
        if (Int16(nutrientsModel.vitaminD) != 0) { newNutrients.vitaminD = Double.convertToDouble(nutrientsModel.vitaminD) }
        if (Int16(nutrientsModel.zinc) != 0) { newNutrients.zinc = Double.convertToDouble(nutrientsModel.zinc) }
        coreDataHelper.create(newNutrients)
        return newNutrients
    }

    /// Adds Nutrients to Meal and Creates a Meal.
    private func addMeal(_ nutrientsModel: NutrientsModel, _ mealModel: MealModel) -> MealCell {
        let nutrientEntity = addNutrients(nutrientsModel)
        let mealCellEntity = MealCell.entity()
        let newMealCell = MealCell(entity: mealCellEntity, insertInto: coreDataHelper.context)
        newMealCell.id = mealModel.id
        newMealCell.date = mealModel.date
        newMealCell.longDate = mealModel.longDate
        newMealCell.name = mealModel.name
        newMealCell.notes = mealModel.notes
        newMealCell.calories = mealModel.calories
        newMealCell.addToMeal(nutrientEntity)
        return newMealCell
    }
    
    /// Adds all data to Core Data.
    /// - Parameters:
    ///   - nutrients: NutrientsModel
    ///   - meal: MealModel
    ///   - day: DayModel
    func addFullMeal(with nutrients: NutrientsModel, _ meal: MealModel, _ day: DayModel) {
        let mealCellEntity = addMeal(nutrients, meal)
        let dayEntity = Day.entity()
        let newDay = Day(entity: dayEntity, insertInto: coreDataHelper.context)
        newDay.id = day.id
        newDay.date = day.date
        newDay.addToMealCell(mealCellEntity)
    }
    
}
