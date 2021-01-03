//
//  Day+CoreDataProperties.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 1/3/21.
//
//

import Foundation
import CoreData


extension Day {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Day> {
        return NSFetchRequest<Day>(entityName: "Day")
    }

    @NSManaged public var date: String
    @NSManaged public var id: UUID?
    @NSManaged public var totalCalories: Int16
    @NSManaged public var mealCell: Set<MealCell>

}

// MARK: Generated accessors for mealCell
extension Day {

    @objc(addMealCellObject:)
    @NSManaged public func addToMealCell(_ value: MealCell)

    @objc(removeMealCellObject:)
    @NSManaged public func removeFromMealCell(_ value: MealCell)

    @objc(addMealCell:)
    @NSManaged public func addToMealCell(_ values: NSSet)

    @objc(removeMealCell:)
    @NSManaged public func removeFromMealCell(_ values: NSSet)

}


extension Day: Identifiable {
    
}
