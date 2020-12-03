//
//  SelectedMealView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/24/20.
//

import SwiftUI

struct SelectedMealView: View {
    var name: String
    var calories: Int16
    
    var body: some View {
        ZStack {
            Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255).edgesIgnoringSafeArea(.all)
                .navigationBarTitle(name, displayMode: .large)
                .navigationBarItems(trailing:
                Text("\(calories)")
                    .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                )
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: UIColor(red: 58 / 255, green: 58 / 255, blue: 60 / 255, alpha: 1.0), tintColor: UIColor.white)
        }
    }
}
