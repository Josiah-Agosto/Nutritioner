//
//  SelectedFoodView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/24/20.
//

import SwiftUI
import Swift

struct SelectedFoodView: View {
    var food: FoodCell
    
    var body: some View {
        ZStack {
            Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255).edgesIgnoringSafeArea(.all)
            Text("Testing")
                .navigationBarTitle(food.name, displayMode: .large)
                .navigationBarItems(trailing:
                    Text("\(food.calories)")
                        .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                )
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: UIColor(red: 58 / 255, green: 58 / 255, blue: 60 / 255, alpha: 1.0), tintColor: UIColor.white)
        }
    }
}
