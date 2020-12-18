//
//  SelectedNutrientView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 12/4/20.
//

import SwiftUI

struct SelectedNutrientView: View {
    // MARK: - References / Properties
    var nutrientName: String
    var nutrientValue: String
    
    var body: some View {
        HStack {
            Text(nutrientName)
                .foregroundColor(Color(red: 170 / 255, green: 170 / 255, blue: 0.6))
                .font(.custom("Helvetica Neue", size: 14))
                .padding(.leading, 8)
            Spacer()
            Text(nutrientValue)
                .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                .font(.custom("Helvetica Neue", size: 16))
                .padding(.trailing, 8)
        }
    }
}
