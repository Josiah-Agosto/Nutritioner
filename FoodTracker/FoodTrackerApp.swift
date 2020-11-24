//
//  FoodTrackerApp.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/20/20.
//

import SwiftUI
import CoreData

@main
struct FoodTrackerApp: App {
    let context = PersistentCloudKitContainer.persistentContainer.viewContext

    var body: some Scene {
        WindowGroup {
            MainView().environment(\.managedObjectContext, context)
        }
    }
}
