//
//  Meal+CoreDataProperties.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 12/20/20.
//
//

import Foundation
import CoreData


extension Meal {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Meal> {
        return NSFetchRequest<Meal>(entityName: "Meal")
    }

    @NSManaged public var biotin: Double
    @NSManaged public var caffeine: Double
    @NSManaged public var calcium: Double
    @NSManaged public var calories: Double
    @NSManaged public var carbohydrates: Double
    @NSManaged public var cholesterol: Double
    @NSManaged public var chromium: Double
    @NSManaged public var copper: Double
    @NSManaged public var fatMonounsaturated: Double
    @NSManaged public var fatPolyunsaturated: Double
    @NSManaged public var fiber: Double
    @NSManaged public var folate: Double
    @NSManaged public var iodine: Double
    @NSManaged public var iron: Double
    @NSManaged public var magnesium: Double
    @NSManaged public var manganese: Double
    @NSManaged public var molybdenum: Double
    @NSManaged public var niacin: Double
    @NSManaged public var pantothenicAcid: Double
    @NSManaged public var phosphorus: Double
    @NSManaged public var potassium: Double
    @NSManaged public var protein: Double
    @NSManaged public var riboflavin: Double
    @NSManaged public var saturatedFat: Double
    @NSManaged public var selenium: Double
    @NSManaged public var sodium: Double
    @NSManaged public var sugars: Double
    @NSManaged public var thiamin: Double
    @NSManaged public var totalFat: Double
    @NSManaged public var vitaminA: Double
    @NSManaged public var vitaminB6: Double
    @NSManaged public var vitaminB12: Double
    @NSManaged public var vitaminC: Double
    @NSManaged public var vitaminD: Double
    @NSManaged public var vitaminE: Double
    @NSManaged public var vitaminK: Double
    @NSManaged public var zinc: Double
    @NSManaged public var mealCell: MealCell

}


extension Meal: Identifiable {
    
}
