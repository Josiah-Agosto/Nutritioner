//
//  FoodCell.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/21/20.
//

import Foundation

struct FoodCell: Identifiable {
    var id = UUID()
    var name: String
    var notes: String
    var date: String
    var calories: Int
}
