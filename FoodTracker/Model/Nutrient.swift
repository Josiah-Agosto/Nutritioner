//
//  Nutrient.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/27/20.
//

import Foundation

// TODO: Find a way to make this for requiredNutrients
/*
 Possible way is create full required Nutrients then have a value that can access the extra nutrients.
 */

enum Nutrient: String, CaseIterable {
    var id: Nutrient { self }
    case dietaryServingSize = "Serving Size"
    case dietaryServingsPerContainer = "Servings Per Container"
    case dietaryCalories = "Calories"
    case dietaryCaloriesFromFat = "Calories From Fat"
    case dietaryFatTotal = "Total Fat"
    case dietaryFatSaturated = "Saturated Fat"
    case dietaryCholesterol = "Cholesterol"
    case dietarySodium = "Sodium"
    case dietaryTotalCarbohydrate  = "Total Carbohydrates"
    case dietaryFiber = "Fiber"
    case dietaryProtein = "Protein"
    case dietaryVitaminA = "Vitamin A"
    case dietaryVitaminC = "Vitamin C"
    case dietaryCalcium = "Calcium"
    case dietaryIron = "Iron"
    case dietaryBiotin = "Biotin"
    case dietaryZinc = "Zinc"
    case dietarySugar = "Sugar"
    case dietaryNiacin = "Niacin"
    case dietaryFolate = "Folate"
    case dietaryIodine = "Iodine"
    case dietaryCopper = "Copper"
    case dietaryThiamin = "Thiamin"
    case dietarySelenium = "Selenium"
    case dietaryChromium = "Chromium"
    case dietaryChloride = "Chloride"
    case dietaryCaffeine = "Caffeine"
    case dietaryMagnesium = "Magnesium"
    case dietaryManganese = "Manganese"
    case dietaryPotassium = "Potassium"
    case dietaryRiboflavin = "Riboflavin"
    case dietaryPhosphorus = "Phosphorus"
    case dietaryMolybdenum = "Molybdenum"
    case dietaryCarbohydrates = "Carbohydrates"
    case dietaryVitaminD = "Vitamin D"
    case dietaryVitaminE = "Vitamin E"
    case dietaryVitaminK = "Vitamin K"
    case dietaryVitaminB6 = "Vitamin B6"
    case dietaryVitaminB12 = "Vitamin B12"
    case dietaryPantothenicAcid = "Pantothenic Acid"
    case dietaryFatPolyunsaturated = "Polyunsaturated Fat"
    case dietaryFatMonounsaturated = "Monounsaturated Fat"
    
    init?(id: Int) {
        switch id {
            case 1: self = .dietaryServingSize
            case 2: self = .dietaryServingsPerContainer
            case 3: self = .dietaryCalories
            case 4: self = .dietaryCaloriesFromFat
            case 5: self = .dietaryFatTotal
            case 6: self = .dietaryFatSaturated
            case 7: self = .dietaryCholesterol
            case 8: self = .dietarySodium
            case 9: self = .dietaryTotalCarbohydrate
            case 10: self = .dietaryFiber
            case 11: self = .dietaryProtein
            case 12: self = .dietaryVitaminA
            case 13: self = .dietaryVitaminC
            case 14: self = .dietaryCalcium
            case 15: self = .dietaryIron
            case 16: self = .dietaryBiotin
            case 17: self = .dietaryZinc
            case 18: self = .dietarySugar
            case 19: self = .dietaryNiacin
            case 20: self = .dietaryFolate
            case 21: self = .dietaryIodine
            case 22: self = .dietaryCopper
            case 23: self = .dietaryThiamin
            case 24: self = .dietarySelenium
            case 25: self = .dietaryChromium
            case 26: self = .dietaryChloride
            case 27: self = .dietaryCaffeine
            case 28: self = .dietaryMagnesium
            case 29: self = .dietaryManganese
            case 30: self = .dietaryPotassium
            case 31: self = .dietaryRiboflavin
            case 32: self = .dietaryPhosphorus
            case 33: self = .dietaryMolybdenum
            case 34: self = .dietaryCarbohydrates
            case 35: self = .dietaryVitaminD
            case 36: self = .dietaryVitaminE
            case 37: self = .dietaryVitaminK
            case 38: self = .dietaryVitaminB6
            case 39: self = .dietaryVitaminB12
            case 40: self = .dietaryPantothenicAcid
            case 41: self = .dietaryFatPolyunsaturated
            case 42: self = .dietaryFatMonounsaturated
            default: return nil
        }
    }
}


extension Nutrient: CustomStringConvertible {
    var description: String {
        return rawValue
    }
}
