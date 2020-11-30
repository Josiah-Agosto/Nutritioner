//
//  FoodCellView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/23/20.
//

import SwiftUI

struct FoodCellView: View {
    var food: MealCell
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                // TODO: Fix this with an Extension to correct the format of date.
                Text("\(food.date!)")
                    .foregroundColor(Color(red: 170 / 255, green: 170 / 255, blue: 0.6))
                    .font(.custom("Helvetica Neue", size: 12))
                    .fontWeight(.medium)
                    .padding(.top, -12)
                    .padding(.leading, 8)
                Text(food.name ?? "")
                    .foregroundColor(Color(red: 170 / 255, green: 170 / 255, blue: 0.6))
                    .font(.custom("Helvetica Neue", size: 18))
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                Text(food.notes ?? "")
                    .foregroundColor(Color(red: 170 / 255, green: 170 / 255, blue: 0.6))
                    .font(.custom("Helvetica Neue", size: 15))
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    .lineLimit(2)
            }
            Spacer()
            Text("\(food.calories ?? "")")
                .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                .font(.title2)
                .padding(.trailing, 8)
        }
        .frame(height: 80)
        .background(Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255))
    }
}
