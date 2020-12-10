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
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(entity: MealCell.entity(), sortDescriptors: [NSSortDescriptor(keyPath: \MealCell.calories, ascending: true)]) var mealCellData: FetchedResults<MealCell>
    // View Models
    @ObservedObject var mainViewModel = MainViewViewModel()
    @ObservedObject var addMealViewModel = AddMealViewModel()

    init() {
        UITableView.appearance().backgroundColor = UIColor.clear
        UITableViewCell.appearance().backgroundColor = UIColor.clear
        UINavigationBar.appearance().largeTitleTextAttributes = [NSAttributedString.Key.font: UIFont(name: "Helvetica Neue", size: 10)!]
    }
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                Color(red: 215 / 255, green: 215 / 255, blue: 219 / 255).edgesIgnoringSafeArea(.all)
                List {
                    ForEach(mealCellData, id: \.id) { mealCell in
                        NavigationLink(destination: SelectedMealView(mainViewModel: mainViewModel, mealCell: mealCell)) {
                            FoodCellView(date: mealCell.date, name: mealCell.name, notes: mealCell.notes, calories: mealCell.calories)
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.1), radius: 6, x: -1.0, y: -0.5)
                                .border(Color(red: 224 / 255, green: 224 / 255, blue: 226 / 255), width: 0.1)
                        }
                        .navigationBarTitle("\(mealCell.name)")
                    }
                    .onDelete(perform: removeMealFromCoreData(at:))
                    .listRowBackground(Color.clear)
                }
                .listSeparatorStyle(style: .none)
                .environment(\.defaultMinListRowHeight, 80)
                .navigationBarItems(leading:
                    Button(action: {
                        mainViewModel.showingCalendar.toggle()
                    }, label: {
                    Image(systemName: "calendar.circle")
                        .font(.system(size: 27))
                        .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                }), trailing:
                    Button(action: {
                        mainViewModel.showingNewMeal.toggle()
                    }, label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 27))
                        .foregroundColor(Color(red: 255 / 255, green: 55 / 255, blue: 95 / 255))
                    })
                )
                NavigationLink(destination: AddMealView(managedContext: _managedObjectContext, viewModel: addMealViewModel).environment(\.managedObjectContext, managedObjectContext), isActive: $mainViewModel.showingNewMeal, label: { })
                NavigationLink(destination: CalendarViewHolder().environment(\.managedObjectContext, managedObjectContext), isActive: $mainViewModel.showingCalendar, label: { })
            }
            .navigationBarTitle(Text(String.getCurrentDay()), displayMode: .large)
        }
        .navigationBarColor(backgroundColor: UIColor(red: 215 / 255, green: 215 / 255, blue: 219 / 255, alpha: 1.0), tintColor: UIColor(red: 170 / 255, green: 170 / 255, blue: 170 / 255, alpha: 1.0))
        .edgesIgnoringSafeArea(.all)
    }
    
    // TODO: Remove this from this view.
    public func removeMealFromCoreData(at offsets: IndexSet) {
        for offset in offsets {
            let mealCell = mealCellData[offset]
            managedObjectContext.delete(mealCell)
        }
        do {
            try managedObjectContext.save()
        } catch let error {
            print("Error, \(error.localizedDescription)")
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
