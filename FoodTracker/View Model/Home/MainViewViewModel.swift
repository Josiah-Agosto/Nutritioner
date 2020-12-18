//
//  MainViewViewModel.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/26/20.
//

import Foundation

class MainViewViewModel: ObservableObject {
    // MARK: - References / Properties
    @Published var meals = [MealCell]()
    @Published var showingView: Bool = false
    @Published var totalCalories: Int16 = 0
    @Published var activeSheet: ActiveMainSheet = .addMeal
    //
    private var dataManager: DataManagerProtocol
    //
    init(dataManager: DataManagerProtocol = DataManager.shared) {
        self.dataManager = dataManager
        fetchMealCells()
    }
    
    //
    public func removeMealFromCoreData(at offsets: IndexSet) {
        for offset in offsets {
            let mealCell = meals[offset]
            CoreDataHelper.shared.delete(mealCell)
        }
        fetchMealCells()
    }

}



extension MainViewViewModel: FetchMealDataProtocol {
    //
    func fetchMealCells() {
        meals = dataManager.fetchMeal(from: String.getCurrentStringDate())
    }
}
