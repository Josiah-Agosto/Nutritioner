//
//  SelectedDateView.swift
//  Nutritioner
//
//  Created by Josiah Agosto on 12/10/20.
//

import SwiftUI

struct SelectedDateView: View {
    // MARK: - References / Properties
    @ObservedObject var selectedDateViewModel: SelectedDateViewModel
    @Environment(\.presentationMode) private var presentationMode
    
    var body: some View {
        ZStack {
            Color("Background").edgesIgnoringSafeArea(.all)
            List {
                ForEach(selectedDateViewModel.meals, id: \.id) { meal in
                    NavigationLink(destination: SelectedMealView(mealCell: meal)) {
                        FoodCellView(date: meal.date, name: meal.name, notes: meal.notes, calories: meal.calories)
                    }
                    .background(Color("Background"))
                    .cornerRadius(12)
                    .shadow(color: Color("Shadow"), radius: 6, x: -1.0, y: -0.5)
                    .border(Color("Contrast"), width: 0.1)
                }
                .listRowBackground(Color.clear)
                .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 5, trailing: 5))
                .buttonStyle(PlainButtonStyle())
                .environment(\.defaultMinListRowHeight, 80)
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                VStack {
                    Text(String.convertStringDateToDayOfWeek(selectedDateViewModel.selectedDate))
                        .font(.system(size: 14))
                        .foregroundColor(Color("AppColor"))
                    Text("\(CoreDataHelper.shared.calculateCalories(selectedDateViewModel.meals, selectedDateViewModel.day))")
                        .font(.system(size: 23))
                        .foregroundColor(Color("AppColor"))
                }
            }
        }
        .onAppear {
            UITableView.appearance().backgroundColor = UIColor.clear
            UITableViewCell.appearance().backgroundColor = UIColor.clear
            selectedDateViewModel.fetchMealCellsInDay(selectedDateViewModel.selectedDate)
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
        .onDisappear {
            selectedDateViewModel.day = []
            selectedDateViewModel.meals = []
            selectedDateViewModel.selectedDate = ""
            selectedDateViewModel.selectedFormattedDate = ""
            selectedDateViewModel.totalCalories = 0
        }
    }
}
