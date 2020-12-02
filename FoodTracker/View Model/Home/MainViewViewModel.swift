//
//  MainViewViewModel.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/26/20.
//

import SwiftUI
import CoreData
import Combine

class MainViewViewModel: ObservableObject {
    // MARK: - References / Properties
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: MealCell.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \MealCell.calories, ascending: true)]) var mealCellData: FetchedResults<MealCell>
    // Navigation Bar Title
    @Published var navigationBarTitle: String = "".getCurrentDay()
}
