//
//  HealthKitStore.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 11/29/20.
//

import Foundation
import HealthKit

class HealthKitStore {
    // MARK: - References / Properties
    private var viewModel: AddMealViewModel? = nil
    private let hkHealthStore = HKHealthStore()
    // Date
    private let currentDate = Date()
    // Quantities
    private let calories = HKObjectType.quantityType(forIdentifier: .dietaryEnergyConsumed)!
    private let totalFat = HKObjectType.quantityType(forIdentifier: .dietaryFatTotal)!
    private let saturatedFat = HKObjectType.quantityType(forIdentifier: .dietaryFatSaturated)!
    private let cholesterol = HKObjectType.quantityType(forIdentifier: .dietaryCholesterol)!
    private let sodium = HKObjectType.quantityType(forIdentifier: .dietarySodium)!
    private let totalCarbohydrate = HKObjectType.quantityType(forIdentifier: .dietaryCarbohydrates)!
    private let fiber = HKObjectType.quantityType(forIdentifier: .dietaryFiber)!
    private let sugar = HKObjectType.quantityType(forIdentifier: .dietarySugar)!
    private let protein = HKObjectType.quantityType(forIdentifier: .dietaryProtein)!
    private let vitaminA = HKObjectType.quantityType(forIdentifier: .dietaryVitaminA)!
    private let vitaminC = HKObjectType.quantityType(forIdentifier: .dietaryVitaminC)!
    private let calcium = HKObjectType.quantityType(forIdentifier: .dietaryCalcium)!
    private let iron = HKObjectType.quantityType(forIdentifier: .dietaryIron)!
    private let biotin = HKObjectType.quantityType(forIdentifier: .dietaryBiotin)!
    private let caffeine = HKObjectType.quantityType(forIdentifier: .dietaryCaffeine)!
    private let chromium = HKObjectType.quantityType(forIdentifier: .dietaryChromium)!
    private let copper = HKObjectType.quantityType(forIdentifier: .dietaryCopper)!
    private let fatMonounsaturated = HKObjectType.quantityType(forIdentifier: .dietaryFatMonounsaturated)!
    private let fatPolyunsaturated = HKObjectType.quantityType(forIdentifier: .dietaryFatPolyunsaturated)!
    private let folate = HKObjectType.quantityType(forIdentifier: .dietaryFolate)!
    private let iodine = HKObjectType.quantityType(forIdentifier: .dietaryIodine)!
    private let magnesium = HKObjectType.quantityType(forIdentifier: .dietaryMagnesium)!
    private let manganese = HKObjectType.quantityType(forIdentifier: .dietaryManganese)!
    private let molybdenum = HKObjectType.quantityType(forIdentifier: .dietaryMolybdenum)!
    private let niacin = HKObjectType.quantityType(forIdentifier: .dietaryNiacin)!
    private let pantothenicAcid = HKObjectType.quantityType(forIdentifier: .dietaryPantothenicAcid)!
    private let phosphorus = HKObjectType.quantityType(forIdentifier: .dietaryPhosphorus)!
    private let potassium = HKObjectType.quantityType(forIdentifier: .dietaryPotassium)!
    private let riboflavin = HKObjectType.quantityType(forIdentifier: .dietaryRiboflavin)!
    private let selenium = HKObjectType.quantityType(forIdentifier: .dietarySelenium)!
    private let vitaminE = HKObjectType.quantityType(forIdentifier: .dietaryVitaminE)!
    private let vitaminK = HKObjectType.quantityType(forIdentifier: .dietaryVitaminK)!
    private let vitaminB6 = HKObjectType.quantityType(forIdentifier: .dietaryVitaminB6)!
    private let vitaminB12 = HKObjectType.quantityType(forIdentifier: .dietaryVitaminB12)!
    private let vitaminD = HKObjectType.quantityType(forIdentifier: .dietaryVitaminD)!
    private let zinc = HKObjectType.quantityType(forIdentifier: .dietaryZinc)!
    
    init(_ viewModel: AddMealViewModel) {
        self.viewModel = viewModel
    }
    
    init() {
    }
    
    /// Initial health Kit setup
    public func settingUpHealthKit() {
        if HKHealthStore.isHealthDataAvailable() {
            let allTypes = Set([calories, totalFat, saturatedFat, cholesterol, sodium, totalCarbohydrate, fiber, sugar, protein, vitaminA, vitaminC, calcium, iron, biotin, caffeine, chromium, copper, fatMonounsaturated, fatPolyunsaturated, folate, iodine, magnesium, manganese, molybdenum, niacin, pantothenicAcid, phosphorus, potassium, riboflavin, selenium, vitaminE, vitaminK, vitaminB6, vitaminB12, vitaminD, zinc])
            hkHealthStore.requestAuthorization(toShare: allTypes, read: nil) { (success, error) in
                if !success {
                    print("Error, \(error!.localizedDescription)")
                }
            }
        } else {
            print("Error, HealthKit not available. \(HKError.errorHealthDataUnavailable)")
        }
    }
    
    /// Saves data to HealthKit.
    /// - Parameter completion: True if successful false if error.
    public func saveMealToHealthKit(with completion: @escaping(Bool) -> Void) {
        // Quantities
        let caloriesQuantity = HKQuantity(unit: HKUnit.largeCalorie(), doubleValue: Double(String.multiplyCalories(String.checkForPercent(viewModel!.calories), viewModel?.servingSize ?? "1")) ?? 0.0)
        let totalFatQuantity = HKQuantity(unit: HKUnit.gram(), doubleValue: Double(viewModel?.totalFat ?? "") ?? 0.0)
        let saturatedFatQuantity = HKQuantity(unit: HKUnit.gram(), doubleValue: Double(viewModel?.saturatedFat ?? "") ?? 0.0)
        let cholesterolQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.cholesterol ?? "") ?? 0.0)
        let sodiumQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.sodium ?? "") ?? 0.0)
        let carbohydratesQuantity = HKQuantity(unit: HKUnit.gram(), doubleValue: Double(viewModel?.carbohydrates ?? "") ?? 0.0)
        let fiberQuantity = HKQuantity(unit: HKUnit.gram(), doubleValue: Double(viewModel?.fiber ?? "") ?? 0.0)
        let sugarQuantity = HKQuantity(unit: HKUnit.gram(), doubleValue: Double(viewModel?.sugars ?? "") ?? 0.0)
        let proteinQuantity = HKQuantity(unit: HKUnit.gram(), doubleValue: Double(viewModel?.protein ?? "") ?? 0.0)
        let vitaminAQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .micro), doubleValue: Double(viewModel?.vitaminA ?? "") ?? 0.0)
        let vitaminCQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.vitaminC ?? "") ?? 0.0)
        let calciumQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.calcium ?? "") ?? 0.0)
        let ironQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.iron ?? "") ?? 0.0)
        let biotinQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .micro), doubleValue: Double(viewModel?.biotin ?? "") ?? 0.0)
        let caffeineQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.caffeine ?? "") ?? 0.0)
        let chromiumQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .micro), doubleValue: Double(viewModel?.chromium ?? "") ?? 0.0)
        let copperQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.copper ?? "") ?? 0.0)
        let fatMonounsaturatedQuantity = HKQuantity(unit: HKUnit.gram(), doubleValue: Double(viewModel?.monounsaturatedFat ?? "") ?? 0.0)
        let fatPolyunsaturatedQuantity = HKQuantity(unit: HKUnit.gram(), doubleValue: Double(viewModel?.polyunsaturatedFat ?? "") ?? 0.0)
        let folateQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .micro), doubleValue: Double(viewModel?.folate ?? "") ?? 0.0)
        let iodineQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .micro), doubleValue: Double(viewModel?.iodine ?? "") ?? 0.0)
        let magnesiumQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.magnesium ?? "") ?? 0.0)
        let manganeseQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.manganese ?? "") ?? 0.0)
        let molybdenumQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .micro), doubleValue: Double(viewModel?.molybdenum ?? "") ?? 0.0)
        let niacinQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.niacin ?? "") ?? 0.0)
        let pantothenicAcidQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.pantothenicAcid ?? "") ?? 0.0)
        let phosphorusQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.phosphorus ?? "") ?? 0.0)
        let potassiumQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.potassium ?? "") ?? 0.0)
        let riboflavinQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.riboflavin ?? "") ?? 0.0)
        let seleniumQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .micro), doubleValue: Double(viewModel?.selenium ?? "") ?? 0.0)
        let vitaminEQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.vitaminE ?? "") ?? 0.0)
        let vitaminKQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .micro), doubleValue: Double(viewModel?.vitaminK ?? "") ?? 0.0)
        let vitaminB6Quantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.vitaminB6 ?? "") ?? 0.0)
        let vitaminB12Quantity = HKQuantity(unit: HKUnit.gramUnit(with: .micro), doubleValue: Double(viewModel?.vitaminB12 ?? "") ?? 0.0)
        let vitaminDQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .micro), doubleValue: Double(viewModel?.vitaminD ?? "") ?? 0.0)
        let zincQuantity = HKQuantity(unit: HKUnit.gramUnit(with: .milli), doubleValue: Double(viewModel?.zinc ?? "") ?? 0.0)
        // Samples
        let caloriesSample = HKQuantitySample(type: calories, quantity: caloriesQuantity, start: currentDate, end: currentDate)
        let totalFatSample = HKQuantitySample(type: totalFat, quantity: totalFatQuantity, start: currentDate, end: currentDate)
        let saturatedFatSample = HKQuantitySample(type: saturatedFat, quantity: saturatedFatQuantity, start: currentDate, end: currentDate)
        let cholesterolSample = HKQuantitySample(type: cholesterol, quantity: cholesterolQuantity, start: currentDate, end: currentDate)
        let sodiumSample = HKQuantitySample(type: sodium, quantity: sodiumQuantity, start: currentDate, end: currentDate)
        let carbohydratesSample = HKQuantitySample(type: totalCarbohydrate, quantity: carbohydratesQuantity, start: currentDate, end: currentDate)
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
        hkHealthStore.save([caloriesSample, totalFatSample, saturatedFatSample, cholesterolSample, sodiumSample, carbohydratesSample, fiberSample, sugarSample, proteinSample, vitaminASample, vitaminCSample, calciumSample, ironSample, biotinSample, caffeineSample, chromiumSample, copperSample, fatMonounsaturatedSample, fatPolyunsaturatedSample, folateSample, iodineSample, magnesiumSample, manganeseSample, molybdenumSample, niacinSample, pantothenicAcidSample, phosphorusSample, potassiumSample, riboflavinSample, seleniumSample, vitaminESample, vitaminKSample, vitaminB6Sample, vitaminB12Sample, vitaminDSample, zincSample]) { (success, error) in
            if !success {
                completion(false)
                print("Error, \(error!.localizedDescription)")
            }
            completion(true)
        }
    }
    
    
}
