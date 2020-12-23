//
//  SelectedDateViewModel.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 12/4/20.
//

import Foundation
import SwiftUI

class SelectedDateViewModel: ObservableObject {
    // MARK: - References / Properties
    @Published var showingSelectedDate: Bool = false
    @Published var day = [Day]()
    @Published var meals = [MealCell]()
    @Published var selectedDate: String = ""
    @Published var selectedFormattedDate: String = ""
    @Published var totalCalories: Int16 = 0
    let dragGesture = DragGesture()
    private var dataManager: DataManagerProtocol
    
    //
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
}


//
extension SelectedDateViewModel: FetchDayProtocol {
    //
    func fetchMealCellsInDay(_ from: String) {
        day = dataManager.fetchDay(from: from)
        for dayMeals in day {
            let newMeals = Array(dayMeals.mealCell)
            meals = newMeals
        }
    }

}
