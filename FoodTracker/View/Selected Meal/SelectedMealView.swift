//
//  SelectedMealView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/24/20.
//

import SwiftUI

struct SelectedMealView: View {
    // MARK: - References / Properties
    var mealCell: MealCell
    
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            VStack {
                Text(mealCell.longDate)
                    .foregroundColor(Color("MealCellText"))
                    .font(.subheadline)
                Text("\(mealCell.calories)")
                    .foregroundColor(Color("AppColor"))
                    .font(.title)
                List {
                    ForEach(Array(mealCell.meal)) { nutrient in
                        Group {
                            SelectedNutrientView(nutrientName: "Calories", nutrientValue: "\(nutrient.calories)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Total Fat (g)", nutrientValue: "\(nutrient.totalFat)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Carbohydrates (g)", nutrientValue: "\(nutrient.carbohydrates)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Cholesterol (mg)", nutrientValue: "\(nutrient.cholesterol)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Sodium (mg)", nutrientValue: "\(nutrient.sodium)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Fiber (g)", nutrientValue: "\(nutrient.fiber)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        }
                        Group {
                            SelectedNutrientView(nutrientName: "Sugars (g)", nutrientValue: "\(nutrient.sugars)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Protein (g)", nutrientValue: "\(nutrient.protein)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Vitamin A (mcg)", nutrientValue: "\(nutrient.vitaminA)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Vitamin C (mg)", nutrientValue: "\(nutrient.vitaminC)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Calcium (mg)", nutrientValue: "\(nutrient.calcium)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Iron (mg)", nutrientValue: "\(nutrient.iron)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Saturated Fat (g)", nutrientValue: "\(nutrient.saturatedFat)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Zinc (mg)", nutrientValue: "\(nutrient.zinc)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Folate (mcg)", nutrientValue: "\(nutrient.folate)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Caffeine", nutrientValue: "\(nutrient.caffeine)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        }
                        Group {
                            SelectedNutrientView(nutrientName: "Biotin (mcg)", nutrientValue: "\(nutrient.biotin)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Iodine (mcg)", nutrientValue: "\(nutrient.iodine)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Copper (mcg)", nutrientValue: "\(nutrient.copper)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Potassium (mg)", nutrientValue: "\(nutrient.potassium)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Vitamin D (mcg)", nutrientValue: "\(nutrient.vitaminD)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Vitamin E (mg)", nutrientValue: "\(nutrient.vitaminE)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Vitamin K (mcg)", nutrientValue: "\(nutrient.vitaminK)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Vitamin B6 (mg)", nutrientValue: "\(nutrient.vitaminB6)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Vitamin B12 (mcg)", nutrientValue: "\(nutrient.vitaminB12)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        }
                        Group {
                            SelectedNutrientView(nutrientName: "Thiamin (mg)", nutrientValue: "\(nutrient.thiamin)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Niacin (mg)", nutrientValue: "\(nutrient.niacin)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Selenium (mcg)", nutrientValue: "\(nutrient.selenium)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Chromium (mcg)", nutrientValue: "\(nutrient.chromium)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Magnesium (mg)", nutrientValue: "\(nutrient.magnesium)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Riboflavin (mg)", nutrientValue: "\(nutrient.riboflavin)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Phosphorus (mg)", nutrientValue: "\(nutrient.phosphorus)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Molybdenum (mcg)", nutrientValue: "\(nutrient.molybdenum)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Pantothenic Acid (mg)", nutrientValue: "\(nutrient.pantothenicAcid)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        }
                        Group {
                            SelectedNutrientView(nutrientName: "Polyunsaturated Fat", nutrientValue: "\(nutrient.fatPolyunsaturated)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            SelectedNutrientView(nutrientName: "Monounsaturated Fat", nutrientValue: "\(nutrient.fatMonounsaturated)")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                            // TODO: Make this separate so if the text is longer it will adjust.
                            SelectedNutrientView(nutrientName: "Notes", nutrientValue: "\(mealCell.notes ?? "")")
                                .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        }
                    }
                    .listRowBackground(Color.clear)
                }
            }
            .navigationBarTitle(mealCell.name, displayMode: .large)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: UIColor(named: "Background")!, tintColor: UIColor.white)
        }
    }
}
