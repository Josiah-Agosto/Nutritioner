//
//  FoodCellView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/23/20.
//

import SwiftUI
import CoreData

struct FoodCellView: View {
    var date: String
    var name: String
    var notes: String?
    var calories: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(date)
                    .foregroundColor(Color("MealCellText"))
                    .font(.custom("Helvetica Neue", size: 12))
                    .fontWeight(.medium)
                    .padding(.top, -12)
                    .padding(.leading, 8)
                Text(name)
                    .foregroundColor(Color("MealCellText"))
                    .font(.custom("Helvetica Neue", size: 18))
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                Text(notes ?? "")
                    .foregroundColor(Color("MealCellText"))
                    .font(.custom("Helvetica Neue", size: 15))
                    .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 0))
                    .lineLimit(2)
            }
            Spacer()
            Text(calories)
                .foregroundColor(Color("AppColor"))
                .font(.title2)
                .padding(.trailing, 8)
        }
        .frame(height: 80)
        .background(Color.clear)
    }
}
