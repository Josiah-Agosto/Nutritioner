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
    // Required Nutrition Fact Types
    @State private var servingSize: String = ""
    @State private var servingsPerContainer: String = ""
    @State private var calories: String = ""
    @State private var caloriesFromFat: String = ""
    @State private var totalFat: String = ""
    @State private var saturatedFat: String = ""
    @State private var transFat: String = ""
    @State private var cholesterol: String = ""
    @State private var sodium: String = ""
    @State private var totalCarbohydrate: String = ""
    @State private var dietaryFiber: String = ""
    @State private var sugars: String = ""
    @State private var protein: String = ""
    @State private var vitaminA: String = ""
    @State private var vitaminC: String = ""
    @State private var calcium: String = ""
    @State private var iron: String = ""
    @State private var showingAddNutrientView = false
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255).edgesIgnoringSafeArea(.all)
                List {
                    Group {
                        AddNutritionTextField(placeholderText: "Serving Size", inputedText: $servingSize)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Servings Per Container", inputedText: $servingsPerContainer)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Calories", inputedText: $calories)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Calories From Fat", inputedText: $caloriesFromFat)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Total Fat", inputedText: $totalFat)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Saturated Fat", inputedText: $saturatedFat)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Trans Fat", inputedText: $transFat)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Cholesterol", inputedText: $cholesterol)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Sodium", inputedText: $sodium)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Total Carbohydrates", inputedText: $totalCarbohydrate)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                    }
                    Group {
                        AddNutritionTextField(placeholderText: "Dietary Fiber", inputedText: $dietaryFiber)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Sugars", inputedText: $sugars)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Protein", inputedText: $protein)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Vitamin A", inputedText: $vitaminA)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Vitamin C", inputedText: $vitaminC)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Calcium", inputedText: $calcium)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        AddNutritionTextField(placeholderText: "Iron", inputedText: $iron)
                            .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                    }
                }
                .blur(radius: showingAddNutrientView ? 3.0 : 0)
                .animation(.easeInOut)
                .disabled(showingAddNutrientView)
                .background(Color.clear)
                
                AddNutritionView()
                    .animation(.easeInOut)
                    .frame(width: .infinity, height: 400, alignment: .center)
                    .position(x: geometry.size.width / 2, y: showingAddNutrientView ? geometry.size.height - 100 : geometry.size.height + 200)
            }
            .background(Color.clear)
            .navigationBarTitle("New Food")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {  }, label: {
                        Image(systemName: "doc.text.viewfinder")
                            .font(.system(size: 27))
                            .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                    })
                    Button(action: {
                        showingAddNutrientView.toggle()
                    }, label: {
                        Image(systemName: "plus")
                            .font(.system(size: 27))
                            .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                    })
                }
            )
        }
    }
    
}

// Transparent Group Box
struct TransparentGroupBox: GroupBoxStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.content
            .background(RoundedRectangle(cornerRadius: 8.0).fill(Color.red))
    }
}


struct AddFoodView_Preview: PreviewProvider {
    static var previews: some View {
        AddMealView()
    }
}
