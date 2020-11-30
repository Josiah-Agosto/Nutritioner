//
//  HealthKitStore.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/29/20.
//

import Foundation
import HealthKit
import SwiftUI

class HealthKitStore {
    // MARK: - References / Properties
    static let shared = HealthKitStore()
    @ObservedObject private var viewModel = AddMealViewModel()
    let hkHealthStore = HKHealthStore()
    // Date
    let currentDate = Date()
    // Quantities
    let calories = HKObjectType.quantityType(forIdentifier: .dietaryEnergyConsumed)!
    let totalFat = HKObjectType.quantityType(forIdentifier: .dietaryFatTotal)!
    let saturatedFat = HKObjectType.quantityType(forIdentifier: .dietaryFatSaturated)!
    let cholesterol = HKObjectType.quantityType(forIdentifier: .dietaryCholesterol)!
    let sodium = HKObjectType.quantityType(forIdentifier: .dietarySodium)!
    let totalCarbohydrate = HKObjectType.quantityType(forIdentifier: .dietaryCarbohydrates)!
    let fiber = HKObjectType.quantityType(forIdentifier: .dietaryFiber)!
    let sugar = HKObjectType.quantityType(forIdentifier: .dietarySugar)!
    let protein = HKObjectType.quantityType(forIdentifier: .dietaryProtein)!
    let vitaminA = HKObjectType.quantityType(forIdentifier: .dietaryVitaminA)!
    let vitaminC = HKObjectType.quantityType(forIdentifier: .dietaryVitaminC)!
    let calcium = HKObjectType.quantityType(forIdentifier: .dietaryCalcium)!
    let iron = HKObjectType.quantityType(forIdentifier: .dietaryIron)!
    let biotin = HKObjectType.quantityType(forIdentifier: .dietaryBiotin)!
    let caffeine = HKObjectType.quantityType(forIdentifier: .dietaryCaffeine)!
    let chromium = HKObjectType.quantityType(forIdentifier: .dietaryChromium)!
    let copper = HKObjectType.quantityType(forIdentifier: .dietaryCopper)!
    let fatMonounsaturated = HKObjectType.quantityType(forIdentifier: .dietaryFatMonounsaturated)!
    let fatPolyunsaturated = HKObjectType.quantityType(forIdentifier: .dietaryFatPolyunsaturated)!
    let folate = HKObjectType.quantityType(forIdentifier: .dietaryFolate)!
    let iodine = HKObjectType.quantityType(forIdentifier: .dietaryIodine)!
    let magnesium = HKObjectType.quantityType(forIdentifier: .dietaryMagnesium)!
    let manganese = HKObjectType.quantityType(forIdentifier: .dietaryManganese)!
    let molybdenum = HKObjectType.quantityType(forIdentifier: .dietaryMolybdenum)!
    let niacin = HKObjectType.quantityType(forIdentifier: .dietaryNiacin)!
    let pantothenicAcid = HKObjectType.quantityType(forIdentifier: .dietaryPantothenicAcid)!
    let phosphorus = HKObjectType.quantityType(forIdentifier: .dietaryPhosphorus)!
    let potassium = HKObjectType.quantityType(forIdentifier: .dietaryPotassium)!
    let riboflavin = HKObjectType.quantityType(forIdentifier: .dietaryRiboflavin)!
    let selenium = HKObjectType.quantityType(forIdentifier: .dietarySelenium)!
    let vitaminE = HKObjectType.quantityType(forIdentifier: .dietaryVitaminE)!
    let vitaminK = HKObjectType.quantityType(forIdentifier: .dietaryVitaminK)!
    let vitaminB6 = HKObjectType.quantityType(forIdentifier: .dietaryVitaminB6)!
    let vitaminB12 = HKObjectType.quantityType(forIdentifier: .dietaryVitaminB12)!
    let vitaminD = HKObjectType.quantityType(forIdentifier: .dietaryVitaminD)!
    let zinc = HKObjectType.quantityType(forIdentifier: .dietaryZinc)!
    
    init() {
        settingUpHealthKit()
    }
    
    //
    private func settingUpHealthKit() {
        if HKHealthStore.isHealthDataAvailable() {
            let allTypes = Set([calories, totalFat, saturatedFat, cholesterol, sodium, totalCarbohydrate, fiber, sugar, protein, vitaminA, vitaminC, calcium, iron, biotin, caffeine, chromium, copper, fatMonounsaturated, fatPolyunsaturated, folate, iodine, magnesium, manganese, molybdenum, niacin, pantothenicAcid, phosphorus, potassium, riboflavin, selenium, vitaminE, vitaminK, vitaminB6, vitaminB12, vitaminD, zinc])
            hkHealthStore.requestAuthorization(toShare: allTypes, read: nil) { (success, error) in
                if !success {
                    print("Error, \(error!.localizedDescription)")
                }
            }
        }
    }
    
    /// Saves data to HealthKit.
    /// - Parameter completion: True if successful false if error.
    public func saveMealToHealthKit(with completion: @escaping(Bool) -> Void) {
        // Quantities
        let caloriesQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.calories.convertToDouble(viewModel.calories))
        let totalFatQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.totalFat.convertToDouble(viewModel.totalFat))
        let saturatedFatQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.saturatedFat.convertToDouble(viewModel.saturatedFat))
        let cholesterolQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.cholesterol.convertToDouble(viewModel.cholesterol))
        let sodiumQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.sodium.convertToDouble(viewModel.sodium))
        let totalCarbohydrateQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.totalCarbohydrate.convertToDouble(viewModel.totalCarbohydrate))
        let fiberQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.fiber.convertToDouble(viewModel.fiber))
        let sugarQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.sugars.convertToDouble(viewModel.sugars))
        let proteinQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.protein.convertToDouble(viewModel.protein))
        let vitaminAQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.vitaminA.convertToDouble(viewModel.vitaminA))
        let vitaminCQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.vitaminC.convertToDouble(viewModel.vitaminC))
        let calciumQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.calcium.convertToDouble(viewModel.calcium))
        let ironQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.iron.convertToDouble(viewModel.iron))
        let biotinQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.biotin.convertToDouble(viewModel.biotin))
        let caffeineQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.caffeine.convertToDouble(viewModel.caffeine))
        let chromiumQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.chromium.convertToDouble(viewModel.chromium))
        let copperQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.copper.convertToDouble(viewModel.copper))
        let fatMonounsaturatedQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.monounsaturatedFat.convertToDouble(viewModel.monounsaturatedFat))
        let fatPolyunsaturatedQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.polyunsaturatedFat.convertToDouble(viewModel.polyunsaturatedFat))
        let folateQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.folate.convertToDouble(viewModel.folate))
        let iodineQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.iodine.convertToDouble(viewModel.iodine))
        let magnesiumQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.magnesium.convertToDouble(viewModel.magnesium))
        let manganeseQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.manganese.convertToDouble(viewModel.manganese))
        let molybdenumQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.molybdenum.convertToDouble(viewModel.molybdenum))
        let niacinQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.niacin.convertToDouble(viewModel.niacin))
        let pantothenicAcidQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.pantothenicAcid.convertToDouble(viewModel.pantothenicAcid))
        let phosphorusQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.phosphorus.convertToDouble(viewModel.phosphorus))
        let potassiumQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.potassium.convertToDouble(viewModel.potassium))
        let riboflavinQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.riboflavin.convertToDouble(viewModel.riboflavin))
        let seleniumQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.selenium.convertToDouble(viewModel.selenium))
        let vitaminEQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.vitaminE.convertToDouble(viewModel.vitaminE))
        let vitaminKQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.vitaminK.convertToDouble(viewModel.vitaminK))
        let vitaminB6Quantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.vitaminB6.convertToDouble(viewModel.vitaminB6))
        let vitaminB12Quantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.vitaminB12.convertToDouble(viewModel.vitaminB12))
        let vitaminDQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.vitaminD.convertToDouble(viewModel.vitaminD))
        let zincQuantity = HKQuantity(unit: HKUnit.count(), doubleValue: viewModel.zinc.convertToDouble(viewModel.zinc))
        // Samples
        let caloriesSample = HKQuantitySample(type: calories, quantity: caloriesQuantity, start: currentDate, end: currentDate)
        let totalFatSample = HKQuantitySample(type: totalFat, quantity: totalFatQuantity, start: currentDate, end: currentDate)
        let saturatedFatSample = HKQuantitySample(type: saturatedFat, quantity: saturatedFatQuantity, start: currentDate, end: currentDate)
        let cholesterolSample = HKQuantitySample(type: cholesterol, quantity: cholesterolQuantity, start: currentDate, end: currentDate)
        let sodiumSample = HKQuantitySample(type: sodium, quantity: sodiumQuantity, start: currentDate, end: currentDate)
        let totalCarbohydrateSample = HKQuantitySample(type: totalCarbohydrate, quantity: totalCarbohydrateQuantity, start: currentDate, end: currentDate)
        let fiberSample = HKQuantitySample(type: fiber, quantity: fiberQuantity, start: currentDate, end: currentDate)
        let sugarSample = HKQuantitySample(type: sugar, quantity: sugarQuantity, start: currentDate, end: currentDate)
        let proteinSample = HKQuantitySample(type: protein, quantity: proteinQuantity, start: currentDate, end: currentDate)
        let vitaminASample = HKQuantitySample(type: vitaminA, quantity: vitaminAQuantity, start: currentDate, end: currentDate)
        let vitaminCSample = HKQuantitySample(type: vitaminC, quantity: vitaminCQuantity, start: currentDate, end: currentDate)
        let calciumSample = HKQuantitySample(type: calcium, quantity: calciumQuantity, start: currentDate, end: currentDate)
        let ironSample = HKQuantitySample(type: iron, quantity: ironQuantity, start: currentDate, end: currentDate)
        let biotinSample = HKQuantitySample(type: biotin, quantity: biotinQuantity, start: currentDate, end: currentDate)
        let caffeineSample = HKQuantitySample(type: caffeine, quantity: caffeineQuantity, start: currentDate, end: currentDate)
        let chromiumSample = HKQuantitySample(type: chromium, quantity: chromiumQuantity, start: currentDate, end: currentDate)
        let copperSample = HKQuantitySample(type: copper, quantity: copperQuantity, start: currentDate, end: currentDate)
        let fatMonounsaturatedSample = HKQuantitySample(type: fatMonounsaturated, quantity: fatMonounsaturatedQuantity, start: currentDate, end: currentDate)
        let fatPolyunsaturatedSample = HKQuantitySample(type: fatPolyunsaturated, quantity: fatPolyunsaturatedQuantity, start: currentDate, end: currentDate)
        let folateSample = HKQuantitySample(type: folate, quantity: folateQuantity, start: currentDate, end: currentDate)
        let iodineSample = HKQuantitySample(type: iodine, quantity: iodineQuantity, start: currentDate, end: currentDate)
        let magnesiumSample = HKQuantitySample(type: magnesium, quantity: magnesiumQuantity, start: currentDate, end: currentDate)
        let manganeseSample = HKQuantitySample(type: manganese, quantity: manganeseQuantity, start: currentDate, end: currentDate)
        let molybdenumSample = HKQuantitySample(type: molybdenum, quantity: molybdenumQuantity, start: currentDate, end: currentDate)
        let niacinSample = HKQuantitySample(type: niacin, quantity: niacinQuantity, start: currentDate, end: currentDate)
        let pantothenicAcidSample = HKQuantitySample(type: pantothenicAcid, quantity: pantothenicAcidQuantity, start: currentDate, end: currentDate)
        let phosphorusSample = HKQuantitySample(type: phosphorus, quantity: phosphorusQuantity, start: currentDate, end: currentDate)
        let potassiumSample = HKQuantitySample(type: potassium, quantity: potassiumQuantity, start: currentDate, end: currentDate)
        let riboflavinSample = HKQuantitySample(type: riboflavin, quantity: riboflavinQuantity, start: currentDate, end: currentDate)
        let seleniumSample = HKQuantitySample(type: selenium, quantity: seleniumQuantity, start: currentDate, end: currentDate)
        let vitaminESample = HKQuantitySample(type: vitaminE, quantity: vitaminEQuantity, start: currentDate, end: currentDate)
        let vitaminKSample = HKQuantitySample(type: vitaminK, quantity: vitaminKQuantity, start: currentDate, end: currentDate)
        let vitaminB6Sample = HKQuantitySample(type: vitaminB6, quantity: vitaminB6Quantity, start: currentDate, end: currentDate)
        let vitaminB12Sample = HKQuantitySample(type: vitaminB12, quantity: vitaminB12Quantity, start: currentDate, end: currentDate)
        let vitaminDSample = HKQuantitySample(type: vitaminD, quantity: vitaminDQuantity, start: currentDate, end: currentDate)
        let zincSample = HKQuantitySample(type: zinc, quantity: zincQuantity, start: currentDate, end: currentDate)
        // Saving values
        hkHealthStore.save([caloriesSample, totalFatSample, saturatedFatSample, cholesterolSample, sodiumSample, totalCarbohydrateSample, fiberSample, sugarSample, proteinSample, vitaminASample, vitaminCSample, calciumSample, ironSample, biotinSample, caffeineSample, chromiumSample, copperSample, fatMonounsaturatedSample, fatPolyunsaturatedSample, folateSample, iodineSample, magnesiumSample, manganeseSample, molybdenumSample, niacinSample, pantothenicAcidSample, phosphorusSample, potassiumSample, riboflavinSample, seleniumSample, vitaminESample, vitaminKSample, vitaminB6Sample, vitaminB12Sample, vitaminDSample, zincSample]) { (success, error) in
            if !success {
                completion(false)
                print("Error, \(error!.localizedDescription)")
            }
            completion(true)
        }
    }
    
    
}
