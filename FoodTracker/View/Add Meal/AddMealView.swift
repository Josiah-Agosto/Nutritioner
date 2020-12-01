//
//  AddMealView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/24/20.
//

import SwiftUI
import UIKit

struct AddMealView: View {
    // MARK: - References/Properties
    // Observable Object
    @ObservedObject var viewModel = AddMealViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255).edgesIgnoringSafeArea(.all)
                List {
                    Group {
                        AddNutritionTextField(placeholder: "Meal Name", input: $viewModel.mealName, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Serving Size", input: $viewModel.servingSize, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Servings Per Container", input: $viewModel.servingsPerContainer, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Calories", input: $viewModel.calories, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                    }
                    Group {
                        AddNutritionTextField(placeholder: "Total Fat", input: $viewModel.totalFat, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Saturated Fat", input: $viewModel.saturatedFat, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Trans Fat", input: $viewModel.transFat, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Cholesterol", input: $viewModel.cholesterol, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Sodium", input: $viewModel.sodium, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Total Carbohydrates", input: $viewModel.totalCarbohydrate, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Fiber", input: $viewModel.fiber, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Sugars", input: $viewModel.sugars, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Protein", input: $viewModel.protein, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                    }
                    Group {
                        AddNutritionTextField(placeholder: "Vitamin A", input: $viewModel.vitaminA, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin C", input: $viewModel.vitaminC, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Calcium", input: $viewModel.calcium, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Iron", input: $viewModel.iron, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Biotin", input: $viewModel.biotin, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Zinc", input: $viewModel.zinc, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Niacin", input: $viewModel.niacin, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Folate", input: $viewModel.folate, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Iodine", input: $viewModel.iodine, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Copper", input: $viewModel.copper, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                    }
                    Group {
                        AddNutritionTextField(placeholder: "Thiamin", input: $viewModel.thiamin, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Selenium", input: $viewModel.selenium, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Chromium", input: $viewModel.chromium, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Chloride", input: $viewModel.chloride, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Caffeine", input: $viewModel.caffeine, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Magnesium", input: $viewModel.magnesium, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Potassium", input: $viewModel.potassium, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Riboflavin", input: $viewModel.riboflavin, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Phosphorus", input: $viewModel.phosphorus, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Molybdenum", input: $viewModel.molybdenum, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                    }
                    Group {
                        AddNutritionTextField(placeholder: "Carbohydrates", input: $viewModel.carbohydrates, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin D", input: $viewModel.vitaminD, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin E", input: $viewModel.vitaminE, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin K", input: $viewModel.vitaminK, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin B6", input: $viewModel.vitaminB6, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Vitamin B12", input: $viewModel.vitaminB12, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Pantothenic Acid", input: $viewModel.pantothenicAcid, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Polyunsaturated Fat", input: $viewModel.polyunsaturatedFat, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Monounsaturated Fat", input: $viewModel.monounsaturatedFat, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholder: "Notes", input: $viewModel.notesText, viewModel: viewModel)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                    }
                    Group {
                        Button(action: {
                            
                        }, label: {
                            HStack {
                                Spacer()
                                Text("Add ... to HealthKit Log")
                                Spacer()
                            }
                        })
                        .frame(height: 55)
                        .background(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255), alignment: .center)
                    }
                    .listRowBackground(Color.clear)
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                }
                .background(Color.clear).edgesIgnoringSafeArea(.all)
            }
            .background(Color.clear).edgesIgnoringSafeArea(.all)
            .navigationBarTitle("New Food")
            .navigationBarItems(trailing:
                Button(action: {  }, label: {
                    Image(systemName: "doc.text.viewfinder")
                        .font(.system(size: 27))
                        .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                })
                
            )
        }
        .onAppear {
            UITableView.appearance().backgroundColor = UIColor.clear
            UITableViewCell.appearance().backgroundColor = UIColor.clear
        }
    }
    
    var textFieldHeight: CGFloat {
        let minimumHeight: CGFloat = 50
        let maximumHeight: CGFloat = 100
        
        if viewModel.notesTextHeight < minimumHeight {
            return minimumHeight
        }
        
        if viewModel.notesTextHeight > maximumHeight {
            return maximumHeight
        }
        
        return viewModel.notesTextHeight
    }
    
}


struct AddFoodView_Preview: PreviewProvider {
    static var previews: some View {
        AddMealView()
    }
}
