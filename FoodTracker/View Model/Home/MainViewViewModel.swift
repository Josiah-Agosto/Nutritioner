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
    @Published var showingNewMeal: Bool = false
    @Published var showingCalendar: Bool = false
}
