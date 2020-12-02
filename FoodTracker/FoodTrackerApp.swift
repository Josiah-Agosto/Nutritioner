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
    let context = PersistenceController.shared.container.viewContext

    var body: some Scene {
        WindowGroup {
            MainView().environment(\.managedObjectContext, context)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                    PersistentCloudKitContainer.saveContext()
                })
                .onAppear {
                    HealthKitStore().settingUpHealthKit()
                }
        }
    }
}
