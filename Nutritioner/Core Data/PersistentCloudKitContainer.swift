//
//  PersistentCloudKitContainer.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/20/20.
//

import Foundation
import CoreData

public class PersistentCloudKitContainer {
    // MARK: - Define Constants / Variables
    public static var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    // MARK: - Initializer
    private init() {}
    // MARK: - Core Data stack
    public static var persistentContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "FoodTracker")
//        // Local Store
//        let localStoreLocation = URL(fileURLWithPath: "")
//        let localStoreDescription = NSPersistentStoreDescription(url: localStoreLocation)
//        localStoreDescription.configuration = "Local"
//        // Cloud-Kit Store
//        let cloudStoreLocation = URL(fileURLWithPath: "")
//        let cloudStoreDescription = NSPersistentStoreDescription(url: cloudStoreLocation)
//        cloudStoreDescription.configuration = "Cloud"
//        cloudStoreDescription.cloudKitContainerOptions = NSPersistentCloudKitContainerOptions(containerIdentifier: "com.JosiahAgosto.Nutritioner")
//        // Update container list of store descriptions
//        container.persistentStoreDescriptions = [localStoreDescription, cloudStoreDescription]
//        //
//        guard let description = container.persistentStoreDescriptions.first else {
//            fatalError("Could not retrieve a persistent store description.")
//        }
//        //
//        let id = "iCloud.com.JosiahAgosto.Nutritioner"
//        let options = NSPersistentCloudKitContainerOptions(containerIdentifier: id)
//
//        description.cloudKitContainerOptions = options
//        //
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
        container.viewContext.mergePolicy = NSMergeByPropertyObjectTrumpMergePolicy
        return container
    }()
    // MARK: - Core Data Saving support
    public static func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
