//
//  MainViewViewModel.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/26/20.
//

import Foundation
import Combine

protocol MainViewViewModelProtocol {
    var meals: [MealCell] { get }
    func fetchMealCells()
}

class MainViewViewModel: ObservableObject {
    // MARK: - References / Properties
    @Published var meals = [MealCell]()
    @Published var showingView: Bool = false
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



extension MainViewViewModel: MainViewViewModelProtocol {
    //
    public func fetchMealCells() {
        meals = dataManager.fetchMeal(from: String.getCurrentStringDate())
    }
}
