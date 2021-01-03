//
//  NutritionerApp.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 11/20/20.
//

import SwiftUI
import CoreData

@main
struct NutritionerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onReceive(NotificationCenter.default.publisher(for: UIApplication.willResignActiveNotification), perform: { _ in
                    PersistentCloudKitContainer.saveContext()
                })
                .onAppear {
                    HealthKitStore().settingUpHealthKit()
                }
        }
    }
}
