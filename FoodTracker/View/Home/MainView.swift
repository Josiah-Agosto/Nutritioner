//
//  MainView.swift
//  FoodTracker
//
//  Created by Josiah Agosto on 11/20/20.
//

import SwiftUI
import UIKit
import Combine

struct MainView: View {
    // MARK: - References / Properties
    // View Models
    @ObservedObject var mainViewModel = MainViewViewModel()
    @ObservedObject var addMealViewModel = AddMealViewModel()

    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = UIColor.clear
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255).edgesIgnoringSafeArea(.all)
                List {
                    ForEach(mainViewModel.meals, id: \.id) { mealCell in
                        NavigationLink(destination: SelectedMealView(mealCell: mealCell)) {
                            FoodCellView(date: mealCell.date, name: mealCell.name, notes: mealCell.notes, calories: mealCell.calories)
                        }
                        .background(Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255))
                        .cornerRadius(12)
                        .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                        .border(Color(red: 224 / 255, green: 224 / 255, blue: 226 / 255), width: 0.1)
                    }.onDelete(perform: mainViewModel.removeMealFromCoreData(at:))
                    .listRowBackground(Color.clear)
                    .listRowInsets(EdgeInsets(top: 10, leading: 5, bottom: 5, trailing: 5))
                    .buttonStyle(PlainButtonStyle())
                }
                .padding(.top, 0)
                .environment(\.defaultMinListRowHeight, 80)
                .navigationBarItems(leading:
                    Button(action: {
                        mainViewModel.showingView = true
                        mainViewModel.activeSheet = .calendar
                    }, label: {
                    Image(systemName: "calendar.circle")
                        .font(.system(size: 27))
                        .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                    }), trailing:
                    Button(action: {
                        mainViewModel.showingView = true
                        mainViewModel.activeSheet = .addMeal
                    }, label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 27))
                        .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                    })
                )
            }
            .fullScreenCover(isPresented: $mainViewModel.showingView) {
                NavigationView {
                    if mainViewModel.activeSheet == .addMeal {
                        AddMealView()
                    } else {
                        CalendarViewHolder()
                    }
                }
                .onDisappear {
                    self.mainViewModel.fetchMealCells()
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    VStack {
                        Text(String.getCurrentDay())
                            .font(.system(size: 14))
                            .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                        Text("\(Int16.convertStringToSafeInt16(mainViewModel.totalCalories, "\(CoreDataHelper.shared.calculateCalories(mainViewModel.meals))"))")
                            .font(.system(size: 23))
                            .foregroundColor(Color(red: 236 / 255, green: 84 / 255, blue: 103 / 255))
                    }
                }
            }
        }
        .navigationBarColor(backgroundColor: UIColor(red: 215 / 255, green: 215 / 255, blue: 219 / 255, alpha: 1.0), tintColor: UIColor(red: 170 / 255, green: 170 / 255, blue: 170 / 255, alpha: 1.0))
        .edgesIgnoringSafeArea(.all)
    }

}

// Allows for Navigation Bar to stay Large.
struct PreventNavigationBarCollapseView: View {
    // MARK: - References / Properties
    private var colorSpacer = Color(UIColor(white: 0.0, alpha: 0.0005))
    
    var body: some View {
        Rectangle()
            .fill(colorSpacer)
            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 1)
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
