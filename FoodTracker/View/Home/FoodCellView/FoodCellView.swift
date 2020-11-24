//
//  FoodCellView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/23/20.
//

import SwiftUI

struct FoodCellView: View {
    var food: FoodCell
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(food.date)
                Text(food.name)
                Text(food.notes)
            }
            Spacer()
            Text("\(food.calories)")
        }
        .padding(.top, 10)
        .cornerRadius(15)
        .background(Color(red: 73 / 255, green: 73 / 255, blue: 75 / 255, opacity: 1.0))
    }
}
