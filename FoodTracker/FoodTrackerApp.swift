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
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                    print("Entered Background, Saving!")
                    PersistentCloudKitContainer.saveContext()
                })
        }
    }
}
