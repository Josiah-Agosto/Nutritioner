//
//  SelectedNutrientView.swift
//  Nutritioner
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
                .foregroundColor(Color("MealCellText"))
                .font(.custom("Helvetica Neue", size: 14))
                .padding(.leading, 8)
            Spacer()
            Text(nutrientValue)
                .foregroundColor(Color("AppColor"))
                .font(.custom("Helvetica Neue", size: 16))
                .padding(.trailing, 8)
        }
    }
}
