//
//  AddFoodView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/24/20.
//

import SwiftUI
import UIKit

struct AddFoodView: View {
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
    
    //
    var newFoodTextField: some View {
        TextField("", text: <#T##Binding<String>#>)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255).edgesIgnoringSafeArea(.all)
                List {
                    Group {
                        TextField("Serving Size", text: $servingSize)
                            .customTextField()
                        TextField("Servings Per Container", text: $servingsPerContainer)
    //                        .customTextField()
                        TextField("Calories", text: $calories)
    //                        .customTextField()
                        TextField("Calories From Fat", text: $caloriesFromFat)
    //                        .customTextField()
                        TextField("Total Fat", text: $totalFat)
    //                        .customTextField()
                        TextField("Saturated Fat", text: $saturatedFat)
    //                        .customTextField()
                        TextField("Trans Fat", text: $transFat)
    //                        .customTextField()
                        TextField("Cholesterol", text: $cholesterol)
    //                        .customTextField()
                        TextField("Sodium", text: $sodium)
    //                        .customTextField()
                        TextField("Total Carbohydrates", text: $totalCarbohydrate)
    //                        .customTextField()
                    }
                    Group {
                        TextField("Dietary Fiber", text: $dietaryFiber)
    //                        .customTextField()
                        TextField("Sugars", text: $sugars)
    //                        .customTextField()
                        TextField("Protein", text: $protein)
    //                        .customTextField()
                        TextField("Vitamin A", text: $vitaminA)
    //                        .customTextField()
                        TextField("Vitamin C", text: $vitaminC)
    //                        .customTextField()
                        TextField("Calcium", text: $calcium)
    //                        .customTextField()
                        TextField("Iron", text: $iron)
    //                        .customTextField()
                    }
                }
            }
            .navigationBarTitle("New Food")
            .navigationBarItems(trailing:
                HStack {
                    Button(action: {  }, label: {
                        Image(systemName: "doc.text.viewfinder")
                            .font(.system(size: 27))
                            .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                    })
                    Button(action: {  }, label: {
                        Image(systemName: "plus")
                            .font(.system(size: 27))
                            .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                    })
                }
            )
        }
    }
}


struct AddFoodView_Preview: PreviewProvider {
    static var previews: some View {
        AddFoodView()
    }
}
