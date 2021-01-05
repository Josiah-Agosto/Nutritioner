//
//  CoreDataHelper.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 12/10/20.
//

import Foundation
import CoreData

protocol CoreDataHelperProtocol {
    func create(_ object: NSManagedObject)
    func fetchDay(_ objectType: NSManagedObject.Type, predicate: NSPredicate?, limit: Int?) -> Result<[NSManagedObject], Error>
    func fetchMeal(_ objectType: NSManagedObject.Type, predicate: NSPredicate?, limit: Int?) -> Result<[NSManagedObject], Error>
    func fetchMealCell(_ objectType: NSManagedObject.Type, predicate: NSPredicate?, limit: Int?) -> Result<[NSManagedObject], Error>
    func saveToContext()
    func delete(_ object: NSManagedObject)
}


class CoreDataHelper: CoreDataHelperProtocol {
    // MARK: - References / Properties
    static let shared = CoreDataHelper()
    var context: NSManagedObjectContext {
        PersistenceController.shared.container.viewContext
    }
    
    //MARK: -  Protocol Methods
    //
    func create(_ object: NSManagedObject) {
        do {
            try context.save()
        } catch let error {
            print("Error Creating, \(error)")
        }
    }
    
    //
    func fetchDay<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate? = nil, limit: Int? = nil) -> Result<[T], Error> {
        let request = NSFetchRequest<T>(entityName: "Day")
        request.predicate = predicate
        if let limit = limit {
            request.fetchLimit = limit
        }
        do {
            let result = try context.fetch(request)
            return .success(result as [T])
        } catch let error {
            return .failure(error)
        }
    }
    
    //
    func fetchMeal<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate?, limit: Int?) -> Result<[T], Error> {
        let request = NSFetchRequest<T>(entityName: "Meal")
        request.predicate = predicate
        if let limit = limit {
            request.fetchLimit = limit
        }
        do {
            let result = try context.fetch(request)
            return .success(result as [T])
        } catch let error {
            return .failure(error)
        }
    }
    
    //
    func fetchMealCell<T: NSManagedObject>(_ objectType: T.Type, predicate: NSPredicate?, limit: Int?) -> Result<[T], Error> {
        let request = NSFetchRequest<T>(entityName: "MealCell")
        request.predicate = predicate
        if let limit = limit {
            request.fetchLimit = limit
        }
        do {
            let result = try context.fetch(request)
            return .success(result as [T])
        } catch let error {
            return .failure(error)
        }
    }
    
    //
    func saveToContext() {
        do {
            try context.save()
        } catch let error {
            print("Error Updating, \(error)")
        }
    }
    
    //
    func delete(_ object: NSManagedObject) {
        context.delete(object)
        saveToContext()
    }
    
    //
    public func calculateCalories(_ from: [MealCell], _ and: [Day]) -> Int16 {
        var allCalories: Int16 = 0
        let _ = from.forEach { (meal) in
            allCalories += Int16(meal.calories) ?? 0
        }
        if !from.isEmpty {
            SharedData.shared.addValuesToPlist(Int(allCalories), String.convertStringDateToDayOfWeek(from[0].longDate), from.count, LatestMeal(mealTitle: and.last?.mealCell.first?.name ?? "No Data", mealTime: and.last?.mealCell.first?.date ?? "No Data", mealCalories: and.last?.mealCell.first?.calories ?? "0"))
        } else {
            SharedData.shared.addValuesToPlist(0, String.getCurrentDay(), 0, LatestMeal(mealTitle: "No Data", mealTime: "No Data", mealCalories: "0"))
        }
        return allCalories
    }

}
