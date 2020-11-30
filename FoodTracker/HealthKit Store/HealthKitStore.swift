//
//  HealthKitStore.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/29/20.
//

import Foundation
import HealthKit

class HealthKitStore {
    // MARK: - References / Properties
    static let shared = HealthKitStore()
    
    init() {
        
    }
    
    private func settingUpHealthKit() {
        if HKHealthStore.isHealthDataAvailable() {
            let hkHealthStore = HKHealthStore()
            
        }
    }
    
}
