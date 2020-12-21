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
            Color("Background").edgesIgnoringSafeArea(.all)
            List {
                ForEach(selectedDateViewModel.meals, id: \.id) { mealCell in
                    NavigationLink(destination: SelectedMealView(mealCell: mealCell)) {
                        FoodCellView(date: mealCell.date, name: mealCell.name, notes: mealCell.notes, calories: mealCell.calories)
                    }
                    .background(Color("Background"))
                    .cornerRadius(12)
                    .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                    .border(Color("Contrast"), width: 0.1)
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
                    .foregroundColor(Color("AppColor"))
            })
        )
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(String.getCurrentDay())
                        .font(.system(size: 14))
                        .foregroundColor(Color("AppColor"))
                    Text("\(Int16.convertStringToSafeInt16(selectedDateViewModel.totalCalories, "\(CoreDataHelper.shared.calculateCalories(selectedDateViewModel.meals))"))")
                        .font(.system(size: 23))
                        .foregroundColor(Color("AppColor"))
                }
            }
        }
    }
}
