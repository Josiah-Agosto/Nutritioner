//
//  SelectedDateView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 12/10/20.
//

import SwiftUI

struct SelectedDateView: View {
    // MARK: - References / Properties
    @ObservedObject var selectedDateViewModel = SelectedDateViewModel()
    @Environment(\.presentationMode) private var presentationMode
    
    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = UIColor.clear
    }
    
    var body: some View {
        ZStack {
            Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255).edgesIgnoringSafeArea(.all)
            List {
                ForEach(selectedDateViewModel.meals, id: \.id) { mealCell in
                    NavigationLink(destination: SelectedMealView(mealCell: mealCell)) {
                        FoodCellView(date: mealCell.date, name: mealCell.name, notes: mealCell.notes, calories: mealCell.calories)
                    }
                    .background(Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255))
                    .cornerRadius(12)
                    .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                    .border(Color(red: 224 / 255, green: 224 / 255, blue: 226 / 255), width: 0.1)
                    .navigationBarTitle("\(mealCell.name)")
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 5, trailing: 5))
                .buttonStyle(PlainButtonStyle())
            }
            .environment(\.defaultMinListRowHeight, 80)
            .navigationBarTitle(selectedDateViewModel.selectedFormattedDate, displayMode: .inline)
        }
        .navigationBarItems(leading:
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }, label: {
                Text("Cancel")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
            })
        )
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(String.getCurrentDay())
                        .font(.system(size: 14))
                        .foregroundColor(Color(red: 170 / 255, green: 170 / 255, blue: 170 / 255))
                    Text("\(Int16.convertStringToSafeInt16(selectedDateViewModel.totalCalories, "\(CoreDataHelper.shared.calculateCalories(selectedDateViewModel.meals))"))")
                        .font(.system(size: 23))
                        .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                }
            }
        }
    }
}
