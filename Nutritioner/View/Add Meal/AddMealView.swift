//
//  AddMealView.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 11/24/20.
//

import SwiftUI
import UIKit

struct AddMealView: View {
    // MARK: - References/Properties
    @Environment(\.presentationMode) private var presentationMode
    // Observable Object
    @ObservedObject private var keyboardManager = KeyboardManager()
    @ObservedObject private var viewModel = AddMealViewModel()
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            GeometryReader { reader in
                List {
                    Group {
                        AddNutritionTextField(placeholder: "Meal Name (required)", input: $viewModel.mealName, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Serving Size", input: $viewModel.servingSize, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Calories", input: $viewModel.calories, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Total Fat (g)", input: $viewModel.totalFat, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Cholesterol (mg)", input: $viewModel.cholesterol, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Sodium (mg)", input: $viewModel.sodium, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Fiber (g)", input: $viewModel.fiber, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Sugars (g)", input: $viewModel.sugars, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                    }
                    Group {
                        AddNutritionTextField(placeholder: "Protein (g)", input: $viewModel.protein, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin A (mcg)", input: $viewModel.vitaminA, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin C (mg)", input: $viewModel.vitaminC, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Calcium (mg)", input: $viewModel.calcium, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Iron (mg)", input: $viewModel.iron, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Saturated Fat (g)", input: $viewModel.saturatedFat, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Zinc (mg)", input: $viewModel.zinc, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Folate (mcg)", input: $viewModel.folate, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Caffeine", input: $viewModel.caffeine, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Biotin (mcg)", input: $viewModel.biotin, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                    }
                    Group {
                        AddNutritionTextField(placeholder: "Iodine (mcg)", input: $viewModel.iodine, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Copper (mcg)", input: $viewModel.copper, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Potassium (mg)", input: $viewModel.potassium, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin D (mcg)", input: $viewModel.vitaminD, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin E (mg)", input: $viewModel.vitaminE, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin K (mcg)", input: $viewModel.vitaminK, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin B6 (mg)", input: $viewModel.vitaminB6, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin B12 (mcg)", input: $viewModel.vitaminB12, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Thiamin (mg)", input: $viewModel.thiamin, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Niacin (mg)", input: $viewModel.niacin, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                    }
                    Group {
                        AddNutritionTextField(placeholder: "Selenium (mcg)", input: $viewModel.selenium, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Chromium (mcg)", input: $viewModel.chromium, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Magnesium (mg)", input: $viewModel.magnesium, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Riboflavin (mg)", input: $viewModel.riboflavin, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Phosphorus (mg)", input: $viewModel.phosphorus, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Molybdenum (mcg)", input: $viewModel.molybdenum, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Pantothenic Acid (mg)", input: $viewModel.pantothenicAcid, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Polyunsaturated Fat", input: $viewModel.polyunsaturatedFat, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Monounsaturated Fat", input: $viewModel.monounsaturatedFat, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Notes", input: $viewModel.notesText, viewModel: viewModel)
                            .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                    }
                    Group {
                        Button(action: {
                            if !viewModel.mealName.isEmpty {
                                viewModel.isAcceptable = true
                                viewModel.addToHomeKitAndCoreData()
                                presentationMode.wrappedValue.dismiss()
                            } else {
                                viewModel.isAcceptable = false
                            }
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Add \(viewModel.mealName + " ")to HealthKit Log")
                                    .foregroundColor(Color("AppColorText"))
                                Spacer()
                            }
                        })
                        .frame(height: 55)
                        .background(Color("AppColor"), alignment: .center)
                    }
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 5, trailing: 5))
                    .cornerRadius(10)
                    .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                }
                .offset(y: viewModel.isViewInSecondPortionOfView(reader.frame(in: .local).midY, viewModel.tappedViewPosition) ? -keyboardManager.currentHeight : 0)
                .background(Color.clear).edgesIgnoringSafeArea(.all)
            }
        }
        .background(Color.clear).edgesIgnoringSafeArea(.all)
        .navigationBarTitle("New Meal")
        .navigationBarItems(leading:
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(Color("AppColor"))
            })
        )
//        trailing:
//            Button(action: {
//
//            }, label: {
//                Image(systemName: "doc.text.viewfinder")
//                    .font(.system(size: 27))
//                    .foregroundColor(Color("AppColor"))
//        })
    }
    
}
