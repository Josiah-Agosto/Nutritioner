//
//  AddNutritionFactsCellView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/25/20.
//

import SwiftUI
import UIKit

struct AddNutritionFactsCellView: View {
    //MARK: - References / Properties
    @Binding var inputedText: String
    
    var body: some View {
        TextField("Other", text: $inputedText)
            .cornerRadius(10)
    }
}
