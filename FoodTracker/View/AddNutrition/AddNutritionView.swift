//
//  AddNutritionView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/27/20.
//

import SwiftUI
import HealthKit

struct AddNutritionView: View {
    // MARK: - References / Properties
    @State private var selectedBinding: String = ""
    @State private var selectedNutrient: Int = 0
    private let testData = [HKQuantityTypeIdentifier.dietaryBiotin.rawValue, HKQuantityTypeIdentifier.dietaryIron.rawValue, HKQuantityTypeIdentifier.dietaryZinc.rawValue, HKQuantityTypeIdentifier.dietaryFiber.rawValue, HKQuantityTypeIdentifier.dietarySugar.rawValue, HKQuantityTypeIdentifier.dietarySodium.rawValue, HKQuantityTypeIdentifier.dietaryNiacin.rawValue, HKQuantityTypeIdentifier.dietaryFolate.rawValue, HKQuantityTypeIdentifier.dietaryIodine.rawValue, HKQuantityTypeIdentifier.dietaryCopper.rawValue, HKQuantityTypeIdentifier.dietaryProtein.rawValue, HKQuantityTypeIdentifier.dietaryCalcium.rawValue, HKQuantityTypeIdentifier.dietaryThiamin.rawValue, HKQuantityTypeIdentifier.dietarySelenium.rawValue, HKQuantityTypeIdentifier.dietaryChromium.rawValue, HKQuantityTypeIdentifier.dietaryChloride.rawValue, HKQuantityTypeIdentifier.dietaryCaffeine.rawValue, HKQuantityTypeIdentifier.dietaryMagnesium.rawValue, HKQuantityTypeIdentifier.dietaryManganese.rawValue, HKQuantityTypeIdentifier.dietaryPotassium.rawValue, HKQuantityTypeIdentifier.dietaryRiboflavin.rawValue, HKQuantityTypeIdentifier.dietaryPhosphorus.rawValue, HKQuantityTypeIdentifier.dietaryMolybdenum.rawValue, HKQuantityTypeIdentifier.dietaryCholesterol.rawValue, HKQuantityTypeIdentifier.dietaryCarbohydrates.rawValue, HKQuantityTypeIdentifier.dietaryFatTotal.rawValue, HKQuantityTypeIdentifier.dietaryVitaminA.rawValue,HKQuantityTypeIdentifier.dietaryVitaminC.rawValue, HKQuantityTypeIdentifier.dietaryVitaminD.rawValue, HKQuantityTypeIdentifier.dietaryVitaminE.rawValue, HKQuantityTypeIdentifier.dietaryVitaminK.rawValue, HKQuantityTypeIdentifier.dietaryVitaminB6.rawValue, HKQuantityTypeIdentifier.dietaryVitaminB12.rawValue, HKQuantityTypeIdentifier.dietaryFatSaturated.rawValue, HKQuantityTypeIdentifier.dietaryEnergyConsumed.rawValue, HKQuantityTypeIdentifier.dietaryPantothenicAcid.rawValue, HKQuantityTypeIdentifier.dietaryFatPolyunsaturated.rawValue, HKQuantityTypeIdentifier.dietaryFatMonounsaturated.rawValue]
    
    var newNutrient: some View {
        AddNutritionTextField(placeholderText: "Other", inputedText: $selectedBinding)
    }
    
    var body: some View {
        VStack {
            Text("Add New Nutrient")
                .font(.title)
            Picker("Nutrient", selection: $selectedNutrient) {
                ForEach(0 ..< testData.count) {
                    Text(self.testData[$0])
                }
            }
        }
        .background(Color.red)
    }

}

