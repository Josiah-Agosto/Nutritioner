//
//  SelectedDateViewModel.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 12/4/20.
//

import Foundation

class SelectedDateViewModel: ObservableObject {
    // MARK: - References / Properties
    @Published var showingSelectedDate: Bool = false
    @Published var meals = [MealCell]()
    @Published var selectedDate: String = ""
    @Published var selectedFormattedDate: String = ""
    @Published var totalCalories: Int16 = 0
    private var dataManager: DataManagerProtocol
    
    //
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
    }
}


//
extension SelectedDateViewModel: FetchMealDataProtocol {
    //
    func fetchMealCells() {
        meals = dataManager.fetchMeal(from: selectedDate)
        print(selectedDate)
        print("Meal: \(meals)")
    }
}
