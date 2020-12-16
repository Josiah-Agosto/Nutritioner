//
//  AddNutritionTextField.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/25/20.
//

import SwiftUI
import UIKit

struct AddNutritionTextField: View {
    //MARK: - References / Properties
    var placeholder: String
    @Binding var input: String
    @ObservedObject var viewModel: AddMealViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(placeholder)
                .font(.custom("Helvetica Neue", size: 14))
                .background(Color.clear)
                .padding(EdgeInsets(top: 3, leading: 4, bottom: -7, trailing: 0))
                .foregroundColor(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255))
            NutritionTextFieldReader(placeholder: placeholder, input: $input, viewModel: viewModel)
        }
        .frame(height: 45)
        .padding(EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5))
        .background(Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255))
        .cornerRadius(10)
        .listRowBackground(Color.clear)
    }
}


struct NutritionTextFieldReader: View {
    // MARK: - References / Properties
    var placeholder: String
    @Binding var input: String
    @ObservedObject var viewModel: AddMealViewModel
    
    var body: some View {
        VStack {
            GeometryReader { reader in
                TextField(placeholder, text: $input)
                    .background(Color.clear)
                    .padding(EdgeInsets(top: 0, leading: 4, bottom: 3, trailing: 0))
                    .foregroundColor(Color(red: 100 / 255, green: 100 / 255, blue: 100 / 255))
                    .onTapGesture {
                        viewModel.tappedViewPosition = reader.frame(in: .named("Custom")).midY
                    }
            }
            Rectangle()
                .fill(Color.gray)
                .frame(height: 0.2, alignment: .top)
        }
    }
}
